import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/core/constants/app_style.dart';
import 'package:flutter/material.dart';

class WebButton extends StatelessWidget {
  final void Function()? onPressed;
  final String textButton;
  const WebButton({
    super.key,
    this.onPressed,
    required this.textButton,
  });

  const WebButton.webMobile({
    super.key,
    this.onPressed,
    required this.textButton,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(200, 60),
          backgroundColor: AppColor.accentColor,
          foregroundColor: AppColor.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          )),
      child: Text(
        textButton,
        style: AppStyle.textContent,
      ),
    );
  }
}
