import 'package:eco_grow/core/components/app_button.dart';
import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class DonateScreen extends StatefulWidget {
  const DonateScreen({super.key});

  @override
  State<DonateScreen> createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.0.h, horizontal: 30.0.w)
            .copyWith(bottom: 100.h),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Donate',
                style: TextStyle(
                  fontSize: 60.0.sp,
                ),
              ),
              Text(
                'As you donate',
                style: TextStyle(
                  fontSize: 30.0.sp,
                ),
              ),
              const Icon(Icons.favorite),
              Lottie.asset(
                frameRate: const FrameRate(100),
                height: 500.h,
                Assets.json.tree1,
                fit: BoxFit.fill,
              ),
              const Spacer(),
              AppButtton(
                label: 'Donate',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
