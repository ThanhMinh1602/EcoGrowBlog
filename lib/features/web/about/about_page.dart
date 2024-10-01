import 'package:eco_grow/core/components/custom_grid_view.dart';
import 'package:eco_grow/core/components/title_text_widget.dart';
import 'package:eco_grow/core/components/responsive/banner_responsive.dart';
import 'package:eco_grow/core/components/responsive/footer_responsive.dart';
import 'package:eco_grow/core/components/text_animated_custom.dart';
import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/core/constants/app_style.dart';
import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:eco_grow/core/utils/app_utils.dart';
import 'package:eco_grow/model/core_value_model.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = context.getWidth() < AppUtils.defineScreenMobile;
    final coreValues = CoreValueModel.coreValue;
    const backgroundImage =
        'https://cdn.pixabay.com/photo/2022/10/23/13/43/canoe-7541311_1280.jpg';
    const title = 'Về chúng tôi';
    return Stack(
      children: [
        ListView(
          children: [
            BannerResponsive(
                isMobileWeb: isMobile,
                bannerImageUrl: backgroundImage,
                bannerTitle: title),
            const SizedBox(height: 30.0),
            const TitleTextWidget(title: 'Giá trị cốt lõi của EcoGrow'),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: isMobile
                      ? AppUtils.mobilePaddingHoriz
                      : context.getWidth() * 0.15,
                  vertical: isMobile ? 10.0 : 20.0),
              child: CustomAppGridView(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(40.0),
                      decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          boxShadow: AppColor.appBoxShaDowns,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Text(
                            coreValues[index].title,
                            style: AppStyle.titleTextWebMobile,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            coreValues[index].content,
                            style: isMobile
                                ? AppStyle.textContentMobile
                                : AppStyle.textContent,
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    );
                  },
                  maxCrossAxisExtent: 700,
                  childAspectRatio: isMobile ? 0.6 : 1),
            ),
            FooterResponsive(isWebMobile: isMobile)
          ],
        ),
      ],
    );
  }
}
