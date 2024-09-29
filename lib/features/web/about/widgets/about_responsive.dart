import 'package:eco_grow/features/web/about/widgets/about_content_base_widget.dart';
import 'package:eco_grow/model/about_model.dart';
import 'package:flutter/material.dart';

class AboutContentResponsive extends StatelessWidget {
  final bool isMobileWeb;
  final List<AboutModel> datas;

  const AboutContentResponsive({
    super.key,
    required this.isMobileWeb,
    required this.datas,
  });

  @override
  Widget build(BuildContext context) {
    return isMobileWeb
        ? _buildAboutContentWebMobile()
        : _buildAboutContentWeb();
  }

  Widget _buildAboutContentWeb() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: datas.length,
      itemBuilder: (context, index) {
        final data = datas[index];
        return AboutContentBaseWidget(
          data: data,
          isOdd: index.isOdd,
        );
      },
    );
  }

  Widget _buildAboutContentWebMobile() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: datas.length,
      itemBuilder: (context, index) {
        final data = datas[index];
        return AboutContentBaseWidget(
          data: data,
          isMobile: true,
        );
      },
    );
  }
}
