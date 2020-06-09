import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:goga/account.dart';
import 'package:goga/categories.dart';
import 'package:goga/help.dart';
import 'package:goga/home.dart';

class Holder extends StatefulWidget {
  @override
  _HolderState createState() => _HolderState();
}

class _HolderState extends State<Holder> {
  int selectedIndex = 0;
  List<Widget> _pages;
  @override
  void initState() {
    super.initState();
    _pages = [Home(),Categories(),Account(),Help()];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  _pages[selectedIndex],
      ),
      bottomNavigationBar: SafeArea(
        child: CurvedNavigationBar(
          index: selectedIndex,
          color: Colors.deepOrange,
          backgroundColor: Colors.white,
          buttonBackgroundColor: Colors.deepOrange,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.home, size: 25.0, color: Colors.white),
            Icon(Icons.list, size: 25.0, color: Colors.white),
            Icon(Icons.account_circle, size: 25.0, color: Colors.white),
            Icon(Icons.help, size: 25.0, color: Colors.white),
          ],
          animationDuration: Duration(milliseconds: 200),
          animationCurve: Curves.bounceInOut,
          onTap: (int index) {
              setState(() {
                selectedIndex = index;
              });
          },
        ),
      ),
    );
  }
}
