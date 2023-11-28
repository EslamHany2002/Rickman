
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rickman/presentation/UI/Home/Taps/Profile/Profile.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedIndex = 0;

  List<Widget> tabItems = [
    Center(child: Text("0")),
    Center(child: Text("1")),
    Profile(),

  ];

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: tabItems[_selectedIndex],
      ),
      bottomNavigationBar: FlashyTabBar(
        animationCurve: Curves.linear,
        selectedIndex: _selectedIndex,
        iconSize: 30,
        showElevation: false, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),

          FlashyTabBarItem(
            icon: Icon(Icons.qr_code_scanner),
            title: Text('Detect'),
          ),

          FlashyTabBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),

        ],
      ),

    );
  }
}
