import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:flutter/material.dart';

class FooterResponsive extends StatelessWidget {
  final bool isWebMobile;
  const FooterResponsive({super.key, required this.isWebMobile});

  @override
  Widget build(BuildContext context) {
    return isWebMobile
        ? _buildFooterWebMobile(context)
        : _buildFooterWeb(context);
  }
}

Widget _buildFooterWeb(BuildContext context) {
  return Container(
    width: context.getWidth(),
    height: 120.0,
    color: AppColor.accentColor,
  );
}

Widget _buildFooterWebMobile(BuildContext context) {
  return Container(
    width: context.getWidth(),
    height: 80.0,
    color: AppColor.accentColor,
  );
}
