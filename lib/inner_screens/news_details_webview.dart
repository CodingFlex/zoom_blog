import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../services/utils.dart';

class NewsDetailsWebView extends StatefulWidget {
  const NewsDetailsWebView({super.key});

  @override
  State<NewsDetailsWebView> createState() => _NewsDetailsWebViewState();
}

class _NewsDetailsWebViewState extends State<NewsDetailsWebView> {
  double _progress = 0.0;
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: color),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "URL",
          style: TextStyle(color: color),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_horiz),
          ),
        ],
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: _progress,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            color: _progress == 1.0 ? Colors.transparent : Colors.red,
          ),
          Expanded(
            child: WebViewWidget(
              controller: WebViewController()
                ..setNavigationDelegate(
                  NavigationDelegate(
                    onProgress: (int progress) {
                      setState(() {
                        _progress = progress / 100;
                      });
                    },
                    // onPageStarted: (String url) {},
                    // onPageFinished: (String url) {},
                    // onWebResourceError: (WebResourceError error) {},
                    // onNavigationRequest: (NavigationRequest request) {
                    //   if (request.url.startsWith('https://www.youtube.com/')) {
                    //     return NavigationDecision.prevent;
                    //   }
                    //   return NavigationDecision.navigate;
                    // },
                  ),
                )
                ..loadRequest(Uri.parse(
                    'https://netflixtechblog.com/building-in-video-search-936766f0017cflutter.dev')),
            ),
          ),
        ],
      ),
    );
  }
}
