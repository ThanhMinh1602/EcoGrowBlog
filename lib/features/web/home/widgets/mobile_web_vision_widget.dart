import 'package:flutter/material.dart';
import 'vision_base_widget.dart';
import 'package:eco_grow/core/constants/app_style.dart';
import 'package:eco_grow/core/utils/app_utils.dart';

class MobileWebVisionWidget extends StatelessWidget {
  const MobileWebVisionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const VisionBaseWidget(
      titleStyle: AppStyle.titleTextWebMobile,
      contentStyle: AppStyle.textContentMobile,
      imageHeight: 200.0,
      paddingHoriz: AppUtils.mobilePaddingHoriz,
    );
  }
}
