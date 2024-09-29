import 'package:eco_grow/core/components/custom_grid_view.dart';
import 'package:eco_grow/core/components/web_button.dart';
import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/core/constants/app_style.dart';
import 'package:eco_grow/core/utils/app_utils.dart';
import 'package:eco_grow/model/story_item.dart';
import 'package:flutter/material.dart';

class GreenStoryResponsive extends StatelessWidget {
  final List<StoryItemModel> datas;
  final bool isMobile;
  const GreenStoryResponsive(
      {super.key, required this.datas, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return isMobile ? _buildGreenStoryWebMobile() : _buildGreenStoryWeb();
  }

  Widget _buildGreenStoryWeb() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppUtils.webPaddingHoriz)
          .copyWith(bottom: 20.0),
      child: Column(
        children: [
          const Text(
              textAlign: TextAlign.center,
              'Những câu chuyện xanh',
              style: AppStyle.titleText),
          const SizedBox(height: 30.0),
          CustomAppGridView(
            itemCount: datas.length,
            maxCrossAxisExtent: 400.0,
            childAspectRatio: 0.75,
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
                          datas[index].imagePath,
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
                                  maxLines: 2,
                                  datas[index].title,
                                  style: AppStyle.textContent
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  datas[index].subTitle,
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
      ),
    );
  }

  Widget _buildGreenStoryWebMobile() {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppUtils.mobilePaddingHoriz),
      child: Column(
        children: [
          const Text(
              textAlign: TextAlign.center,
              'Những câu chuyện xanh Web Mobile',
              style: AppStyle.titleTextWebMobile),
          const SizedBox(height: 10.0),
          CustomAppGridView(
            itemCount: datas.length,
            maxCrossAxisExtent: double.infinity,
            childAspectRatio: 0.58,
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
                          datas[index].imagePath,
                          width: double.infinity,
                          height: constraints.maxHeight * 0.45,
                          fit: BoxFit.cover,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  datas[index].title,
                                  style: AppStyle.textContent
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  datas[index].subTitle,
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
      ),
    );
  }
}
