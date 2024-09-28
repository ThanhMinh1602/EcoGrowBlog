import 'package:eco_grow/core/components/app_banner_widget.dart';
import 'package:eco_grow/core/components/footer.dart';
import 'package:eco_grow/core/components/web_button.dart';
import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/core/constants/app_style.dart';
import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:eco_grow/model/story_item.dart';
import 'package:eco_grow/features/web/blog/widgets/green_story.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final stories = StoryItemModel.stories;
    return ListView(
      children: [
        const AppBannerWidget(
          backgroundImage:
              'https://cdn.pixabay.com/photo/2024/04/12/19/50/earthday-8692504_1280.png',
          title: 'Hãy hành động để phủ xanh môi trường sống của chúng ta!',
        ),
        GreenStory(stories: stories),
        const Footer()
      ],
    );
  }
}
