import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../models/article_model.dart';

class WebViewer extends StatelessWidget {
  const WebViewer({super.key, required this.articalModel});
  final ArticleModel articalModel;
  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(articalModel.url!));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title:  const Row(
      //mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text("News",
             style: TextStyle(
              fontWeight:FontWeight.bold,
              fontSize: 23,
             ),),
             Text("Cloud",
             style: TextStyle(
              color: Colors.red,
              fontWeight:FontWeight.bold,
              fontSize: 23,
             ),),
          ],
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
