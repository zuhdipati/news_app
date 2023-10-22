import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailController extends GetxController {
  late WebViewController webViewController;
  late String articleUrl;

  @override
  void onInit() {
    super.onInit();
    webViewController = WebViewController();
    loadArticleUrl();
  }

  void loadArticleUrl() {
    articleUrl = Get.arguments as String;
    webViewController.loadRequest(Uri.parse(articleUrl));
  }
}
