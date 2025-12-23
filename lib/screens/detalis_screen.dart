import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetalisScreen extends StatelessWidget {
  const DetalisScreen({super.key, required this.newsMap});

  final dynamic newsMap;

  Widget _buildImage() {
    final imageUrl = newsMap["urlToImage"];

    if (imageUrl == null || imageUrl == "null" || imageUrl.toString().isEmpty) {
      return Image.asset("assets/newsImage.jpg", fit: BoxFit.fill);
    }

    return Image.network(
      imageUrl,
      fit: BoxFit.fill,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset("assets/newsImage.jpg", fit: BoxFit.fill);
      },
    );
  }

  Widget _description() {
    final description = newsMap["description"];

    if (description == null) {
      return SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        SizedBox(height: 8.h),
        Text(  description ?? "", style: TextStyle(fontSize: 18.sp)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(22.r),
                child: SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: _buildImage(),
                ),
              ),

              SizedBox(height: 20.h),

              Text(
                "Title",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 8.h),
              Text(newsMap["title"] ?? "", style: TextStyle(fontSize: 18.sp)),

              SizedBox(height: 20.h),

              _description(),
              
              SizedBox(height: 20.h),

              Text(
                "Content",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 8.h),
              Text(newsMap["content"] ?? "", style: TextStyle(fontSize: 18.sp)),
            ],
          ),
        ),
      ),
    );
  }
}
