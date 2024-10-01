import 'package:eco_grow/core/components/divider_icon.dart';
import 'package:eco_grow/core/components/text_animated_custom.dart';
import 'package:eco_grow/core/constants/app_style.dart';
import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:eco_grow/features/web/home/widgets/live_green.dart';
import 'package:eco_grow/model/about_model.dart';
import 'package:flutter/material.dart';

class LiveGreenResponsive extends StatelessWidget {
  final bool isMobile;
  final List<AboutModel> datas;

  const LiveGreenResponsive({
    super.key,
    required this.isMobile,
    required this.datas,
  });

  @override
  Widget build(BuildContext context) {
    return isMobile
        ? _buildAboutContentWebMobile(context)
        : _buildAboutContentWeb(context);
  }

  Widget _buildAboutContentWeb(BuildContext context) {
    return Column(
      children: [
        const TextAnimatedCustom('Sống xanh', style: AppStyle.titleText),
        DividerWithIcon(
          horizontalPadding: context.getWidth() * 0.28,
        ),
        const SizedBox(height: 20),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: datas.length,
          itemBuilder: (context, index) {
            final data = datas[index];
            return LiveGreenWidget(
              data: data,
              isOdd: index.isOdd,
            );
          },
        ),
      ],
    );
  }

  Widget _buildAboutContentWebMobile(BuildContext context) {
    return Column(
      children: [
        const TextAnimatedCustom('Sống xanh',
            style: AppStyle.titleTextWebMobile),
        DividerWithIcon(
          horizontalPadding: context.getWidth() * 0.28,
        ),
        const SizedBox(height: 20),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: datas.length,
          itemBuilder: (context, index) {
            final data = datas[index];
            return LiveGreenWidget(
              data: data,
              isMobile: true,
            );
          },
        ),
      ],
    );
  }
}
