import 'package:eco_grow/core/constants/app_style.dart';
import 'package:eco_grow/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            Assets.images.welcome.path,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          top: 200.h,
          bottom: 100.0.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: 'logoHero',
                child: Image.asset(
                  Assets.icons.logo.path,
                  width: 90.0.w,
                ),
              ),
              Text('Welcome', style: AppStyle.welcomeText),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
