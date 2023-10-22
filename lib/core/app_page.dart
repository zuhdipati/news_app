import 'package:get/get.dart';
import 'package:news_app/core/app_routes.dart';
import 'package:news_app/screen/pages/home_page.dart';
import 'package:news_app/screen/pages/news_detail_page.dart';
import 'package:news_app/screen/pages/news_page.dart';

abstract class AppPages {
  static const initial = Routes.splash;
  static final pages = [
    GetPage(name: Routes.home, page: () => HomePage()),
    GetPage(name: Routes.news, page: () => News()),
    GetPage(name: Routes.detail, page: () => NewsDetail()),
  ];
}
