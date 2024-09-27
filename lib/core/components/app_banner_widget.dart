import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/core/constants/app_style.dart';
import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:flutter/material.dart';

class AppBannerWidget extends StatelessWidget {
  final String backgroundImage;
  final String title;
  const AppBannerWidget({
    super.key,
    required this.backgroundImage,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50.0),
      width: context.getHeight(),
      height: 400.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            color: AppColor.blackColor.withOpacity(0.2),
          ),
          Padding(
            padding: const EdgeInsets.all(100),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  textAlign: TextAlign.center,
                  title,
                  textStyle: AppStyle.bannerText,
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              totalRepeatCount: 4,
            ),
          ),
        ],
      ),
    );
  }
}
