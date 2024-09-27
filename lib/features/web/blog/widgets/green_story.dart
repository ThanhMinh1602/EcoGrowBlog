import 'package:eco_grow/core/components/custom_grid_view.dart';
import 'package:eco_grow/core/components/web_button.dart';
import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/core/constants/app_style.dart';
import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:eco_grow/core/model/story_item.dart';
import 'package:flutter/material.dart';

class GreenStory extends StatelessWidget {
  const GreenStory({
    super.key,
    required this.stories,
  });

  final List<StoryItemModel> stories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
            textAlign: TextAlign.center,
            'Những câu chuyện xanh',
            style: AppStyle.titleText),
        const SizedBox(height: 30.0),
        CustomAppGridView(
          itemCount: stories.length,
          maxCrossAxisExtent: 400.0,
          childAspectRatio: 0.68,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: AppColor.blackColor.withOpacity(0.2),
                      offset: const Offset(0, 2),
                      blurRadius: 2,
                      spreadRadius: 1)
                ],
                color: AppColor.whiteColor,
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    children: [
                      Image.network(
                        stories[index].imagePath,
                        width: double.infinity,
                        height: constraints.maxHeight * 0.45,
                        fit: BoxFit.cover,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 10.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                stories[index].title,
                                style: AppStyle.textContent
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10.0),
                              Text(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                stories[index].subTitle,
                                style: AppStyle.textContent,
                              ),
                              const Spacer(),
                              Center(
                                child: WebButton(
                                  textButton: 'Xem Ngay',
                                  onPressed: () {},
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
