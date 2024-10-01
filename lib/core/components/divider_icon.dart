import 'package:eco_grow/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class DividerWithIcon extends StatelessWidget {
  final double horizontalPadding;
  const DividerWithIcon({super.key, required this.horizontalPadding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: const Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 2.0,
              color: AppColor.accentColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              Icons.star,
              color: AppColor.accentColor,
              size: 24.0,
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 2.0,
              color: AppColor.accentColor,
            ),
          ),
        ],
      ),
    );
  }
}
