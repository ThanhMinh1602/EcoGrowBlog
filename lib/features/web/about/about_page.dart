import 'package:eco_grow/core/components/app_banner_widget.dart';
import 'package:eco_grow/core/components/footer.dart';
import 'package:eco_grow/core/components/web_mobile_banner_widget.dart';
import 'package:eco_grow/core/components/web_mobile_footer.dart';
import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:eco_grow/core/utils/app_utils.dart';
import 'package:eco_grow/features/web/about/widgets/about_content_widget.dart';
import 'package:eco_grow/features/web/about/widgets/web_mobile_about_content.dart';
import 'package:eco_grow/model/about_model.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.getWidth();
    final datas = AboutModel.aboutModels;
    const backgroundImage =
        'https://cdn.pixabay.com/photo/2022/10/23/13/43/canoe-7541311_1280.jpg';
    const title = 'Về chúng tôi';

    return ListView(
      children: [
        screenWidth < AppUtils.defineScreenMobile
            ? const WebMobileBannerWidget(
                backgroundImage: backgroundImage, title: title)
            : const AppBannerWidget(
                backgroundImage: backgroundImage,
                title: title,
              ),
        screenWidth < AppUtils.defineScreenMobile
            ? WebMobileAboutContent(
                datas: datas,
              )
            : AboutContentWidget(datas: datas),
        const SizedBox(height: 30.0),
        screenWidth < AppUtils.defineScreenMobile
            ? const WebMobileFooter()
            : const Footer()
      ],
    );
  }
}
