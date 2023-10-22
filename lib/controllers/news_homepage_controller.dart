import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:news_app/models/news_model.dart';
import 'package:news_app/services/constants.dart' as constants;

class NewsController extends GetxController {
  final isLoading = true.obs;
  final searchController = TextEditingController();
  var articles = [].obs;
  List category = [
    "Business",
    "Entertainment",
    "General",
    "Health",
    "Science",
    "Sports",
    "Technology",
  ];

  Future<void> getData(String category, String query) async {
    String url;
    if (category == "Business") {
      url = constants.business;
    } else if (category == "Entertainment") {
      url = constants.entertainment;
    } else if (category == "General") {
      url = constants.general;
    } else if (category == "Health") {
      url = constants.health;
    } else if (category == "Science") {
      url = constants.science;
    } else if (category == "Sports") {
      url = constants.sports;
    } else if (category == "Technology") {
      url = constants.technology;
    } else {
      return;
    }

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonData = convert.jsonDecode(response.body);
      final news = News.fromJson(jsonData);
      if (query.isEmpty) {
        articles.value = news.articles!;
      } else {
        final filteredArticle = news.articles!
            .where((articles) =>
                articles.title!.toLowerCase().contains(query.toLowerCase()))
            .toList();
        articles.value = filteredArticle;
      }
      isLoading.value = false;
    } else {
      throw Exception('Failed to fetch news');
    }
  }

  void clearData() {
    searchController.clear();
    articles.clear();
    isLoading.value = true;
  }
}
