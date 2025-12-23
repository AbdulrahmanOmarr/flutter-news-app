import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/routing/router_genration.dart';
import 'package:news_app/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: RouterGenration.goRouter,
        );
      },
      child: MainScreen(),
    );
  }
}


//  debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
//       home: MainScreen(),
//     );