import 'package:eco_grow/core/components/responsive/banner_responsive.dart';
import 'package:eco_grow/core/components/responsive/footer_responsive.dart';
import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:eco_grow/core/utils/app_utils.dart';
import 'package:eco_grow/features/web/home/widgets/vision_responsive.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String bannerImageUrl =
      'https://cdn.pixabay.com/photo/2024/04/20/11/47/ai-generated-8708404_960_720.jpg';
  static const String bannerTitle =
      '"Cùng EcoGrow Xanh Hóa Thế Giới Từ Những Hạt Giống Nhỏ!"';

  @override
  Widget build(BuildContext context) {
    final bool isMobile = context.getWidth() < AppUtils.defineScreenMobile;
    return ListView(
      children: [
        BannerResponsive(
          isMobileWeb: isMobile,
          bannerImageUrl: bannerImageUrl,
          bannerTitle: bannerTitle,
        ),
        VisionResponsive(isMobile: isMobile),
        FooterResponsive(isWebMobile: isMobile)
      ],
    );
  }
}
