import 'package:flutter/material.dart';
import 'package:eco_grow/model/about_model.dart';
import 'about_content_base_widget.dart';

class WebMobileAboutContent extends StatelessWidget {
  final List<AboutModel> datas;

  const WebMobileAboutContent({super.key, required this.datas});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: datas.length,
      itemBuilder: (context, index) {
        final data = datas[index];
        return AboutContentBaseWidget(data: data, isMobile: true);
      },
    );
  }
}
