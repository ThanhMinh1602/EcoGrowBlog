import 'package:eco_grow/core/components/custom_grid_view.dart';
import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/core/constants/app_style.dart';
import 'package:eco_grow/core/utils/app_utils.dart';
import 'package:eco_grow/model/story_item.dart';
import 'package:flutter/material.dart';

class BlogDetail extends StatelessWidget {
  final StoryItemModel storyItemModel;
  const BlogDetail({super.key, required this.storyItemModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
        title: Text(
            textAlign: TextAlign.center,
            storyItemModel.title,
            style: AppStyle.titleText),
      ),
      backgroundColor: AppColor.whiteColor,
      body: ListView(
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
          // const SizedBox(height: 20.0),
          // Row(
          //   children: [
          //     for (int i = 1; i < storyItemModel.imagePath.length; i++) ...[
          //       Expanded(
          //         child: Image.network(
          //           storyItemModel.imagePath[i],
          //           fit: BoxFit.cover,
          //           height: 400,
          //         ),
          //       ),
          //       if (i < storyItemModel.imagePath.length - 1)
          //         const SizedBox(width: 20),
          //     ],
          //   ],
          // )

          // SizedBox(
          //   height: 300,
          //   child: ListView.separated(
          //       scrollDirection: Axis.horizontal,
          //       itemBuilder: (context, index) {
          //         return Image.network(
          //           storyItemModel.imagePath[index + 1],

          //         );
          //       },
          //       separatorBuilder: (context, index) =>
          //           const SizedBox(width: 20.0),
          //       itemCount: storyItemModel.imagePath.length - 1),
          // ),
        ],
      ),
    );
  }
}
