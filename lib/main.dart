import 'package:eco_grow/features/mobile/splash/splash_screen.dart';
import 'package:eco_grow/features/web/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? MaterialApp(
            title: 'Blog App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              textTheme: GoogleFonts.kanitTextTheme(),
            ),
            home: const MainPage(),
          )
        : ScreenUtilInit(
            designSize: const Size(430, 932),
            minTextAdapt: true,
            child: MaterialApp(
              title: 'Blog App',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                useMaterial3: true,
                textTheme: GoogleFonts.kanitTextTheme(),
              ),
              home: const SplashScreen(),
            ),
          );
  }
}
