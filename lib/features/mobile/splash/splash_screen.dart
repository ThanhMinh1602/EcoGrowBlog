import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/core/extensions/app_extension.dart';
import 'package:eco_grow/features/mobile/login/login_screen.dart';
import 'package:eco_grow/features/mobile/onboarding/onboarding_screen.dart';
import 'package:eco_grow/features/mobile/main/main_screen.dart'; // Màn hình chính sau khi đăng nhập
import 'package:eco_grow/gen/assets.gen.dart';
import 'package:eco_grow/service/local/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SharedPreferencesService prefsService = SharedPreferencesService();

  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await prefsService.init(); // Khởi tạo SharedPreferences

    // Kiểm tra xem ứng dụng mở lần đầu hay không
    bool isFirstTime = prefsService.isFirstTime();

    // Kiểm tra người dùng đã đăng nhập chưa (dựa vào UID)
    String? uid = await prefsService.getUid();

    Future.delayed(const Duration(seconds: 2), () {
      if (isFirstTime) {
        // Nếu là lần đầu mở ứng dụng, điều hướng đến màn hình Onboarding
        context.pushAndRemoveUntil(screen: const OnBoardingScreen());
      } else if (uid != null) {
        // Nếu người dùng đã đăng nhập, điều hướng đến MainScreen (màn hình chính)
        context.pushAndRemoveUntil(screen: const MainScreen());
      } else {
        // Nếu chưa đăng nhập, điều hướng đến màn hình Login
        context.pushAndRemoveUntil(screen: const LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Center(
        child: Hero(
          tag: 'logoHero',
          child: Image.asset(
            Assets.icons.logo.path,
            width: 100.w,
          ),
        ),
      ),
    );
  }
}
