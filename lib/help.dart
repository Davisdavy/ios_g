import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> with AutomaticKeepAliveClientMixin{
  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  double progress = 0;
  InAppWebViewController webView;

  Future<bool> _onBack() async {
    bool goBack;

    var value = await webView.canGoBack(); // check webview can go back

    if (value) {
      webView.goBack(); // perform webview back operation

      return false;
    } else {
      SystemChannels.platform.invokeMethod(
          'SystemNavigator.pop'); // If user press Yes pop the page

      return goBack;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBack,
      child: Scaffold(
          body: Container(
              child: Column(
                  children: <Widget>[
        (progress != 1.0)
            ? LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange))
            : null, // Should be removed while showing

        Expanded(
          child: Container(
            child: InAppWebView(
              initialUrl: 'https://goga.co.ke/help/',
              initialHeaders: {},
              onWebViewCreated: (InAppWebViewController controller) {
                webView = controller;
              },
              onLoadStart: (InAppWebViewController controller, String url) {},
              onProgressChanged:
                  (InAppWebViewController controller, int progress) {
                setState(() {
                  this.progress = progress / 100;
                });
              },
              initialOptions: null,
            ),
          ),
        )
      ].where((Object o) => o != null).toList()))),
    ); //Remove null widgets
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
