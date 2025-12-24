
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsContainer extends StatefulWidget {
  const NewsContainer({super.key, required this.newsMap, this.onClick});
  final dynamic newsMap;
  final Function()? onClick;

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: widget.onClick,
        child: Container(
          height: 135.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 233, 233, 233),
            borderRadius: BorderRadius.circular(22.r),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.only(
                  topLeft: Radius.circular(22.r),
                  bottomLeft: Radius.circular(22.r),
                ),
                child: Image.network(
                  width: 115.w,
                  height: double.infinity,
                  fit: BoxFit.fill,
                  widget.newsMap["urlToImage"] ??
                      "https://plus.unsplash.com/premium_photo-1707080369554-359143c6aa0b?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bmV3cyUyMHdlYnNpdGV8ZW58MHx8MHx8fDA%3D",
                ),
              ),
              SizedBox(width: 5.w),
              Container(
                height: double.infinity,
                width: 220.w,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  borderRadius: BorderRadius.circular(22.r),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        widget.newsMap["title"],
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        widget.newsMap["description"] ?? "",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              widget.newsMap["author"] ?? "",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Text(
                            "${widget.newsMap["publishedAt"]}",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
