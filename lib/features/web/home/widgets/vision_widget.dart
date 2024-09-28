import 'package:flutter/material.dart';
import 'vision_base_widget.dart';
import 'package:eco_grow/core/constants/app_style.dart';

class VisionWidget extends StatelessWidget {
  const VisionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const VisionBaseWidget(
      titleStyle: AppStyle.titleText,
      contentStyle: AppStyle.textContent,
      imageHeight: 500.0,
      paddingHoriz: 50.0,
    );
  }
}
