import 'package:eco_grow/core/components/footer.dart';
import 'package:eco_grow/core/components/app_banner_widget.dart';
import 'package:eco_grow/core/components/web_mobile_banner_widget.dart';
import 'package:eco_grow/core/components/web_mobile_footer.dart';
import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:eco_grow/core/utils/app_utils.dart';
import 'package:eco_grow/features/web/home/widgets/mobile_web_vision_widget.dart';
import 'package:eco_grow/features/web/home/widgets/vision_widget.dart';
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
        _buildBanner(isMobile),
        _buildVisionWidget(isMobile),
        _buildFooter(isMobile),
      ],
    );
  }

  Widget _buildBanner(bool isMobile) {
    return isMobile
        ? const WebMobileBannerWidget(
            backgroundImage: bannerImageUrl,
            title: bannerTitle,
          )
        : const AppBannerWidget(
            backgroundImage: bannerImageUrl,
            title: bannerTitle,
          );
  }

  Widget _buildVisionWidget(bool isMobile) {
    return isMobile ? const MobileWebVisionWidget() : const VisionWidget();
  }

  Widget _buildFooter(bool isMobile) {
    return isMobile ? const WebMobileFooter() : const Footer();
  }
}
