import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/screen/pages/home_page.dart'; // Import halaman utama

class SplashScreen extends GetView {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => HomePage());
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/news.png"),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "NewsApp",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
