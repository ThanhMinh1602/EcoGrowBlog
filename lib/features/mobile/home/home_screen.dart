import 'package:eco_grow/core/components/app_button.dart';
import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:eco_grow/features/mobile/donate/donate_screen.dart';
import 'package:eco_grow/features/mobile/home/widgets/description_widget.dart';
import 'package:eco_grow/features/mobile/home/widgets/infomation_widget.dart';
import 'package:eco_grow/features/mobile/home/widgets/welcome_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();
  int pageIndex = 0;
  void _onTapNext() {
    if (pageIndex == 2) {
      context.push(screen: const DonateScreen());
    }
    pageController.nextPage(
        duration: const Duration(milliseconds: 100), curve: Curves.linear);
  }

  void _onTapPrevious() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 100), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: pageController,
          onPageChanged: (value) {
            pageIndex = value;
            setState(() {});
          },
          children: const [
            WelcomeWidget(),
            InformationWidget(),
            DescriptionWidget(),
          ],
        ),
        Positioned(
          left: 30.0.w,
          right: 30.0.w,
          bottom: 100.h,
          child: Row(
            children: [
              if (pageIndex != 0)
                Expanded(
                  child: AppButtton(
                    label: 'Previous',
                    onPressed: _onTapPrevious,
                  ),
                ),
              if (pageIndex != 0) SizedBox(width: 20.0.w),
              Expanded(
                child: AppButtton(
                    label: pageIndex == 0 ? 'Start' : 'Next',
                    onPressed: _onTapNext),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
