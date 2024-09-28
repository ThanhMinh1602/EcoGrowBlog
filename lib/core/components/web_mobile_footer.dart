import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:flutter/material.dart';

class WebMobileFooter extends StatelessWidget {
  const WebMobileFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(),
      height: 80.0,
      color: AppColor.accentColor,
    );
  }
}
