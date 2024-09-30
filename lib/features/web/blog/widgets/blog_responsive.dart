import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:eco_grow/core/components/custom_grid_view.dart';
import 'package:eco_grow/core/components/web_button.dart';
import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/core/constants/app_style.dart';
import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:eco_grow/core/utils/app_utils.dart';
import 'package:eco_grow/features/web/blog_detail/blog_detail.dart';
import 'package:eco_grow/model/story_item.dart';
import 'package:flutter/material.dart';

class GreenStoryResponsive extends StatelessWidget {
  final List<StoryItemModel> datas;
  final bool isMobile;

  const GreenStoryResponsive(
      {super.key, required this.datas, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    void onPressedDetail(StoryItemModel storyItemModel) {
      context.push(screen: BlogDetail(storyItemModel: storyItemModel));
    }

    List<StoryItemModel> communityDatas =
        datas.where((element) => element.isCommunity == true).toList();
    List<StoryItemModel> personalDatas =
        datas.where((element) => element.isCommunity == false).toList();

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal:
            isMobile ? AppUtils.mobilePaddingHoriz : AppUtils.webPaddingHoriz,
      ).copyWith(bottom: 20.0),
      child: Column(
        children: [
          const SizedBox(height: 30.0),
          AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              ColorizeAnimatedText(
                textAlign: TextAlign.center,
                'Câu chuyện cá nhân',
                textStyle:
                    isMobile ? AppStyle.titleTextWebMobile : AppStyle.titleText,
                colors: AppColor.homTitleTextColorize,
                speed: const Duration(milliseconds: 100),
              ),
            ],
          ),
          Divider(
            color: AppColor.accentColor,
            indent: context.getWidth() * 0.42,
            endIndent: context.getWidth() * 0.42,
            thickness: 3,
          ),
          _buildStoryGrid(personalDatas, onPressedDetail, isMobile),
          const SizedBox(height: 30.0),
          AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              ColorizeAnimatedText(
                textAlign: TextAlign.center,
                'Câu chuyện cộng đồng',
                textStyle:
                    isMobile ? AppStyle.titleTextWebMobile : AppStyle.titleText,
                colors: AppColor.homTitleTextColorize,
                speed: const Duration(milliseconds: 100),
              ),
            ],
          ),
          Divider(
            color: AppColor.accentColor,
            indent: context.getWidth() * 0.42,
            endIndent: context.getWidth() * 0.42,
            thickness: 3,
          ),
          _buildStoryGrid(communityDatas, onPressedDetail, isMobile),
        ],
      ),
    );
  }

  Widget _buildStoryGrid(List<StoryItemModel> storyDatas,
      void Function(StoryItemModel) onPressed, bool isMobile) {
    return CustomAppGridView(
      itemCount: storyDatas.length,
      maxCrossAxisExtent: isMobile ? double.infinity : 400.0,
      childAspectRatio: isMobile ? 1 : 0.8,
      itemBuilder: (context, index) {
        return _buildStoryItem(storyDatas[index], onPressed, isMobile);
      },
    );
  }

  Widget _buildStoryItem(StoryItemModel data,
      void Function(StoryItemModel) onPressed, bool isMobile) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColor.blackColor.withOpacity(0.2),
            offset: const Offset(0, 2),
            blurRadius: 2,
            spreadRadius: 1,
          )
        ],
        color: AppColor.whiteColor,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Image.network(
                data.imagePath.first,
                width: double.infinity,
                height: isMobile
                    ? constraints.maxHeight * 0.6
                    : constraints.maxHeight * 0.6,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 10.0 : 20.0,
                    vertical: 10.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.title,
                        maxLines: isMobile ? 3 : 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyle.textContent.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Center(
                        child: WebButton(
                          textButton: 'Xem Ngay',
                          onPressed: () => onPressed(data),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
