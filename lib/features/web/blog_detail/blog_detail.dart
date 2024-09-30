import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/core/constants/app_style.dart';
import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:eco_grow/core/utils/app_utils.dart';
import 'package:eco_grow/features/web/blog_detail/widgets/blog_detail_responsive.dart';
import 'package:eco_grow/model/story_item.dart';
import 'package:flutter/material.dart';

class BlogDetail extends StatelessWidget {
  final StoryItemModel storyItemModel;
  const BlogDetail({super.key, required this.storyItemModel});

  @override
  Widget build(BuildContext context) {
    bool isMobile = context.getWidth() < AppUtils.defineScreenMobile;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
        title: Flexible(
          child: Text(
              textAlign: TextAlign.center,
              storyItemModel.title,
              softWrap: true,
              overflow: TextOverflow.visible,
              style:
                  isMobile ? AppStyle.titleTextWebMobile : AppStyle.titleText),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu, color: Colors.transparent))
        ],
      ),
      backgroundColor: AppColor.whiteColor,
      body: BlogDetailResponsive(
        isMobile: isMobile,
        storyItemModel: storyItemModel,
      ),
    );
  }
}
