import 'package:eco_grow/core/components/app_bar_custom.dart';
import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/core/constants/app_style.dart';
import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:eco_grow/features/web/about/about_page.dart';
import 'package:eco_grow/features/web/blog/blog_page.dart';
import 'package:eco_grow/features/web/contact/contact_page.dart';
import 'package:eco_grow/features/web/donate/donate_page.dart';
import 'package:eco_grow/features/web/home/home_page.dart';
import 'package:eco_grow/model/main_model.dart';
import 'package:eco_grow/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int indexStack = 1;

  final List<MainModel> mainModels = [
    MainModel(title: 'Home', page: const HomePage()),
    MainModel(title: 'Về chúng tôi', page: const AboutPage()),
    MainModel(title: 'Blog', page: const BlogPage()),
    MainModel(title: 'Quyên góp', page: const DonatePage()),
    MainModel(title: 'Liên hệ', page: const ContactPage()),
  ];

  void _onNavButtonPressed(int index) {
    setState(() {
      indexStack = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.getWidth();
    return Scaffold(
      endDrawer: _buildAppDrawer(),
      backgroundColor: AppColor.whiteColor,
      appBar: AppbarCustom(
        logoImg: Assets.icons.logo.path,
        actions: [
          if (screenWidth < 700)
            Builder(
              builder: (context) => IconButton(
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                icon: const Icon(Icons.menu),
              ),
            )
          else
            ..._buildNavButtons(),
        ],
      ),
      body: IndexedStack(
        index: indexStack,
        children: mainModels.map((model) => model.page).toList(),
      ),
    );
  }

  Drawer _buildAppDrawer() {
    return Drawer(
      child: ListView(
        children: _buildNavButtons(),
      ),
    );
  }

  List<Widget> _buildNavButtons() {
    return mainModels
        .asMap()
        .entries
        .map((entry) => _buildNavButton(entry.value.title, entry.key))
        .toList()
      ..add(const SizedBox(width: 50.0));
  }

  Widget _buildNavButton(String label, int index) {
    final isActive = indexStack == index;
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: isActive ? AppColor.accentColor : Colors.transparent,
      ),
      onPressed: () => _onNavButtonPressed(index),
      child: Text(
        label,
        style: isActive ? AppStyle.webHeaderItemActive : AppStyle.webHeaderItem,
      ),
    );
  }
}
