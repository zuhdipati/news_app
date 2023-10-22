import 'package:flutter/material.dart';
import 'package:news_app/controllers/news_detail_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';

class NewsDetail extends StatelessWidget {
  NewsDetail({super.key});

  final DetailController _controller = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: _controller.webViewController),
    );
  }
}
