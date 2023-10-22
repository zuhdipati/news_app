import 'package:flutter/material.dart';
import 'package:news_app/controllers/news_homepage_controller.dart';
import 'package:news_app/core/app_routes.dart';
import 'package:news_app/core/colors.dart';
import 'package:get/get.dart';

class HomePage extends GetView {
  final newsController = Get.put(NewsController());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor,
        centerTitle: true,
        title: const Text("News Category"),
      ),
      body: GridView.builder(
        shrinkWrap: true,
        itemCount: newsController.category.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              String judul = newsController.category[index];
              Get.toNamed(Routes.news, arguments: judul);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorsApp.primaryColor,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.newspaper,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    newsController.category[index],
                    style: const TextStyle(color: Colors.black),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
