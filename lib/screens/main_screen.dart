import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/routing/app_route';
import 'package:news_app/screens/detalis_screen.dart';
import 'package:news_app/widgets/head_bar.dart';
import 'package:news_app/widgets/news_container.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff000547),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 15.h),
              HeadBar(),
              SizedBox(height: 5.h),
              Expanded(
                child: FutureBuilder(
                  future: getNewsFromApi(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      Response response = snapshot.data;
                      final dynamic dynamicData = response.data;
                      List newsList = dynamicData["articles"];

                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisExtent: 135,
                        ),
                        itemCount: newsList.length,
                        itemBuilder: (context, index) {
                          final newsReferenses = newsList[index];
                          return NewsContainer(
                            newsMap: newsList[index],
                            onClick: () {
                              context.pushNamed(
                                AppRoutes.detalisScreen,
                                extra: newsReferenses, // dynamic
                              );
                            },
                          );
                        },
                      );
                    }
                  },
                ),
              ),
              SizedBox(height: 5.h),
            ],
          ),
        ),
      ),
    );
  }
}

Future<Response> getNewsFromApi() async {
  final Dio dio = Dio();
  final Response response = await dio.get(
    "https://newsapi.org/v2/everything?q=bitcoin&apiKey=65682c120fd9405fbb00c8e2c4e8c24a",
  );
  return response;
}
