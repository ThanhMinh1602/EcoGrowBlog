import 'package:eco_grow/core/components/responsive/banner_responsive.dart';
import 'package:eco_grow/core/components/responsive/footer_responsive.dart';
import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:eco_grow/core/utils/app_utils.dart';
import 'package:eco_grow/features/web/about/widgets/about_responsive.dart';
import 'package:eco_grow/model/about_model.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = context.getWidth() < AppUtils.defineScreenMobile;
    final datas = AboutModel.aboutModels;
    const backgroundImage =
        'https://cdn.pixabay.com/photo/2022/10/23/13/43/canoe-7541311_1280.jpg';
    const title = 'Về chúng tôi';
    return ListView(
      children: [
        BannerResponsive(
            isMobileWeb: isMobile,
            bannerImageUrl: backgroundImage,
            bannerTitle: title),
        AboutContentResponsive(
          isMobileWeb: isMobile,
          datas: datas,
        ),
        const SizedBox(height: 30.0),
        FooterResponsive(isWebMobile: isMobile)
      ],
    );
  }
}
