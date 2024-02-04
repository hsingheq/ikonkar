import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

enum ProgressIndicatorType { circular, linear }

class ReadPath extends StatefulWidget {
  String _getURL = '';
  String _getTitle = '';
  String _getsubtitle = '';

  ReadPath(String url, String title, String subtitle, {super.key}) {
    _getURL = url;
    _getTitle = title;
    _getsubtitle = subtitle;
  }

  @override
  _ReadPathState createState() => _ReadPathState();
}

class _ReadPathState extends State<ReadPath> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;
  double progress = 0;
  ProgressIndicatorType type = ProgressIndicatorType.linear;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget._getTitle,
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                widget._getsubtitle,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          backgroundColor: Color(0xFF303030),
          foregroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () async {
                await webViewController?.loadUrl(
                  urlRequest: URLRequest(url: WebUri(widget._getURL)),
                );
              },
              icon: const Icon(Icons.home),
            ),
            IconButton(
              onPressed: () async {
                // ignore: deprecated_member_use
                await webViewController?.clearCache();
                await webViewController?.reload();
              },
              icon: const Icon(Icons.refresh),
            ),
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text(ProgressIndicatorType.linear.name),
                  onTap: () {
                    setState(() {
                      type = ProgressIndicatorType.linear;
                    });
                  },
                ),
                PopupMenuItem(
                  child: Text(ProgressIndicatorType.circular.name),
                  onTap: () {
                    setState(() {
                      type = ProgressIndicatorType.circular;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: [
                  InAppWebView(
                    key: webViewKey,
                    initialUrlRequest: URLRequest(url: WebUri(widget._getURL)),
                    onWebViewCreated: (controller) {
                      webViewController = controller;
                    },
                    onProgressChanged: (controller, progress) {
                      setState(() {
                        this.progress = progress / 100;
                      });
                    },
                    onLoadStop: (controller, url) async {
                      // Add your custom CSS directly here
                      String customCss = '''
                    .navbar-brand, .pull-left{
                        display: none;
                    }
                    .navbar-default{
                        background-color: #303030 !important;
                    }
                      ''';

                      // Escape the multiline string using jsonEncode
                      String escapedCss = jsonEncode(customCss);

                      // Execute the JavaScript to inject the CSS
                      await controller.evaluateJavascript(
                          source:
                              'var style = document.createElement("style"); style.innerHTML = $escapedCss; document.head.appendChild(style);');
                    },
                  ),
                  progress < 1.0 ? getProgressIndicator(type) : Container(),
                ],
              ),
            ),
          ],
        ));
  }

  Widget getProgressIndicator(ProgressIndicatorType type) {
    switch (type) {
      case ProgressIndicatorType.circular:
        return Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white.withAlpha(70),
            ),
            child: const CircularProgressIndicator(),
          ),
        );
      case ProgressIndicatorType.linear:
      default:
        return LinearProgressIndicator(
          value: progress,
        );
    }
  }
}
