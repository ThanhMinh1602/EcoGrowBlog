import 'package:eco_grow/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButtton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  const AppButtton({super.key, this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.accentColor,
          foregroundColor: AppColor.whiteColor,
          minimumSize: Size(
            200.0.w,
            50.0.h,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 25.0.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
