import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories>
    with AutomaticKeepAliveClientMixin{

  @override
  void initState() {
    super.initState();
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
          body:IndexedStack(
              index: position,
              children: <Widget>[

                WebView(
                  initialUrl: 'https://goga.co.ke/categories/',
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
      ),
    ); //Remove null widgets
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
