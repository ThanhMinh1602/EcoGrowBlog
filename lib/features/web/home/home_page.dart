import 'package:eco_grow/core/components/footer.dart';
import 'package:eco_grow/core/components/app_banner_widget.dart';
import 'package:eco_grow/features/web/home/widgets/title_home_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        AppBannerWidget(
          backgroundImage:
              'https://cdn.pixabay.com/photo/2024/04/20/11/47/ai-generated-8708404_960_720.jpg',
          title: '"Cùng EcoGrow Xanh Hóa Thế Giới Từ Những Hạt Giống Nhỏ!"',
        ),
        VisionWidget(),
        Footer(),
      ],
    );
  }
}
