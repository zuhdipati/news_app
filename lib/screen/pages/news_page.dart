import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/app_routes.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/controllers/news_homepage_controller.dart';

class News extends StatelessWidget {
  final controller = Get.put(NewsController());
  final judul = Get.arguments;

  News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getData(judul, "");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor,
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Get.back();
              controller.clearData();
            },
            child: const Icon(Icons.arrow_back_ios_new)),
        title: Text("$judul News"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: TextField(
              controller: controller.searchController,
              decoration: const InputDecoration(
                hintText: 'Search articles..',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (query) {
                if (query.isEmpty) {
                  controller.getData(judul, query);
                } else {
                  controller.getData(judul, query);
                }
              },
            ),
          ),
          Obx(() {
            if (controller.isLoading.value == true) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (controller.articles.isEmpty) {
              return const Center(
                child: Text("tidak ada article"),
              );
            } else {
              return Expanded(
                child: ListView.builder(
                  itemCount: controller.articles.length,
                  itemBuilder: (context, index) {
                    Articles article = controller.articles[index];
                    return InkWell(
                      onTap: () {
                        Get.toNamed(Routes.detail, arguments: article.url);
                      },
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        width: MediaQuery.of(context).size.width,
                        height: 160,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorsApp.secondaryColor),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                article.title!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Column(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          article.author == null
                                              ? "."
                                              : article.author!,
                                          style: const TextStyle(
                                              color: Colors.blue)),
                                      Text(article.publishedAt!)
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
