import 'package:eco_grow/core/components/app_bar_custom.dart';
import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/core/constants/app_style.dart';
import 'package:eco_grow/core/model/main_model.dart';
import 'package:eco_grow/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int indexStack = 2;

  final mainModels = MainModel.mainModels;

  void _onNavButtonPressed(int index) {
    setState(() {
      indexStack = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppbarCustom(
        logoImg: Assets.icons.logo.path,
        actions: _buildNavButtons(),
      ),
      body: IndexedStack(
        index: indexStack,
        children: List.generate(
          mainModels.length,
          (index) => mainModels[index].page,
        ),
      ),
    );
  }

  List<Widget> _buildNavButtons() {
    return [
      ...List.generate(
        mainModels.length,
        (index) => _buildNavButton(mainModels[index].title, index),
      ),
      const SizedBox(width: 50.0),
    ];
  }

  Widget _buildNavButton(String label, int index) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor:
            indexStack == index ? AppColor.accentColor : Colors.transparent,
      ),
      onPressed: () => _onNavButtonPressed(index),
      child: Text(
        label,
        style: indexStack == index
            ? AppStyle.webHeaderItemActive
            : AppStyle.webHeaderItem,
      ),
    );
  }
}
