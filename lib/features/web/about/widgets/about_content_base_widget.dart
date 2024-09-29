import 'package:eco_grow/core/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:eco_grow/core/constants/app_style.dart';
import 'package:eco_grow/model/about_model.dart';

class AboutContentBaseWidget extends StatelessWidget {
  final AboutModel data;
  final bool isMobile;
  final bool isOdd;

  const AboutContentBaseWidget({
    super.key,
    required this.data,
    this.isMobile = false,
    this.isOdd = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal:
            isMobile ? AppUtils.mobilePaddingHoriz : AppUtils.webPaddingHoriz,
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildImage(),
                const SizedBox(height: 16.0),
                _buildTextColumn(),
              ],
            )
          : Row(
              children: isOdd
                  ? [
                      Flexible(child: _buildTextColumn()),
                      Flexible(child: _buildImage()),
                    ]
                  : [
                      Flexible(child: _buildImage()),
                      Flexible(child: _buildTextColumn()),
                    ],
            ),
    );
  }

  Widget _buildTextColumn() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.title,
            style: isMobile ? AppStyle.titleTextWebMobile : AppStyle.titleText,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8.0),
          ...data.content.map(
            (text) => Padding(
              padding: const EdgeInsets.only(bottom: 7.0),
              child: Text(
                text,
                style: isMobile
                    ? AppStyle.textContentMobile
                    : AppStyle.textContent,
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      width: double.infinity,
      height: isMobile ? 200 : 600,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://cdn.pixabay.com/photo/2024/01/08/17/59/dandelion-8496044_1280.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
