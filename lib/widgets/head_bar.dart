import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadBar extends StatelessWidget {
  const HeadBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 100.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(22)),
        image: DecorationImage(
          image: NetworkImage(
            "https://img.freepik.com/free-vector/global-broadcast-breaking-news-banner-with-global-map_1017-59836.jpg?semt=ais_hybrid&w=740&q=80",
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
