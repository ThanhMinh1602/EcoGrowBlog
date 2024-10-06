import 'package:eco_grow/core/components/app_button.dart';
import 'package:eco_grow/core/constants/app_style.dart';
import 'package:eco_grow/core/extensions/double_extension.dart';
import 'package:eco_grow/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CreateCampaignScreen extends StatelessWidget {
  const CreateCampaignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(10000000.0.toVND(), style: AppStyle.titleText),
        SizedBox(height: 60.0.h),
        Lottie.asset(Assets.json.tree1),
        SizedBox(height: 60.0.h),
        AppButton(
          textButton: 'Quyên góp ngay',
          onPressed: () {},
        )
      ],
    );
  }
}
