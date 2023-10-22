import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/app_page.dart';
import 'package:news_app/screen/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      getPages: AppPages.pages,
      home: const SplashScreen(),
    );
  }
}
