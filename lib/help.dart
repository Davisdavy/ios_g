import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';


class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }
  num position = 1 ;

  final key = UniqueKey();

  doneLoading(String A) {
    setState(() {
      position = 0;
    });
  }

  startLoading(String A) {
    setState(() {
      position = 1;
    });
  }

  double progress = 0;

  Future<bool> _onBack() async {
    bool goBack;

//    var value = await webView.canGoBack(); // check webview can go back
//
//    if (value) {
//      webView.goBack(); // perform webview back operation
//
//      return false;
//    } else {
//      SystemChannels.platform.invokeMethod(
//          'SystemNavigator.pop'); // If user press Yes pop the page
//
//      return goBack;
//    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBack,
      child: Scaffold(
          body: IndexedStack(
              index: position,
              children: <Widget>[

                WebView(
                  initialUrl: 'https://goga.co.ke/help/',
                  javascriptMode: JavascriptMode.unrestricted,
                  key: key,
                  onPageFinished: doneLoading,
                  onPageStarted: startLoading,
                ),

                Container(
                  color: Colors.white,
                  child: Center(
                      child: CircularProgressIndicator()),
                ),

              ]
          ),
        )
    ); //Remove null widgets
  }


}
