import 'package:eco_grow/core/components/app_button.dart';
import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:eco_grow/features/mobile/login/login_screen.dart';
import 'package:eco_grow/features/mobile/onboarding/widgets/description_widget.dart';
import 'package:eco_grow/features/mobile/onboarding/widgets/infomation_widget.dart';
import 'package:eco_grow/features/mobile/onboarding/widgets/welcome_widget.dart';
import 'package:eco_grow/service/local/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController();
  int pageIndex = 0;

  Future<void> _completeOnboarding() async {
    SharedPreferencesService prefsService = SharedPreferencesService();
    await prefsService.setFirstTime(false);
    context.push(screen: const LoginScreen());
  }

  void _onTapNext() {
    if (pageIndex == 2) {
      _completeOnboarding();
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 100),
        curve: Curves.linear,
      );
    }
  }

  void _onTapPrevious() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 100),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                pageIndex = value;
              });
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
                    child: AppButton(
                      onPressed: _onTapPrevious,
                      textButton: 'Previous',
                    ),
                  ),
                if (pageIndex != 0) SizedBox(width: 20.0.w),
                Expanded(
                  child: AppButton(
                    textButton: pageIndex == 2 ? 'Finish' : 'Next',
                    onPressed: _onTapNext,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
