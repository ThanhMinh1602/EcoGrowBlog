import 'package:eco_grow/core/constants/app_style.dart';
import 'package:eco_grow/core/utils/app_utils.dart';
import 'package:eco_grow/model/story_item.dart';
import 'package:flutter/material.dart';

class BlogDetailResponsive extends StatelessWidget {
  final bool isMobile;
  final StoryItemModel storyItemModel;
  const BlogDetailResponsive(
      {super.key, required this.isMobile, required this.storyItemModel});

  @override
  Widget build(BuildContext context) {
    return isMobile
        ? _buildBlogDetailWebMobile(storyItemModel)
        : _buildBlogDetailWeb(storyItemModel);
  }

  Widget _buildBlogDetailWeb(StoryItemModel storyItemModel) {
    return ListView(
      padding: const EdgeInsets.symmetric(
          horizontal: AppUtils.webPaddingHoriz, vertical: 30.0),
      children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Flexible(
              child: Image.network(
            storyItemModel.imagePath[0],
            fit: BoxFit.cover,
          )),
          const SizedBox(width: 20.0),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: storyItemModel.content.map<Widget>((e) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 7.0),
                  child: Text(
                    e,
                    style: AppStyle.textContent,
                    textAlign: TextAlign.justify,
                  ),
                );
              }).toList(),
            ),
          )
        ]),
      ],
    );
  }

  Widget _buildBlogDetailWebMobile(StoryItemModel storyItemModel) {
    return ListView(
      padding: const EdgeInsets.symmetric(
          horizontal: AppUtils.mobilePaddingHoriz, vertical: 30.0),
      children: [
        Image.network(
          storyItemModel.imagePath[0],
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 20.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: storyItemModel.content.map<Widget>((e) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 7.0),
              child: Text(
                e,
                style: AppStyle.textContentMobile,
                textAlign: TextAlign.justify,
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
