import 'package:khanomfood/ui/pages.dart';
import 'package:khanomfood/main.dart';

import 'package:flutter/material.dart';
import 'package:khanomfood/ui/pages/kitchen_page.dart';
import 'package:khanomfood/ui/pages/notification_page.dart';
import 'package:khanomfood/ui/pages/setting_page.dart';
import 'package:khanomfood/ui/pages/storefront_page.dart';

class NavigationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NavigationChild(title: 'Navigation'),
    );
  }
}

class NavigationChild extends StatefulWidget {
  NavigationChild({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<NavigationChild> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    NotificationPage(),
    KitchenPage(),
    StorefrontPage(),
    SettingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.pink,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.sms,
              size: 35,
            ),
            title: Text(
              'แจ้งเตือน',
              style: TextStyle(fontFamily: 'supermarket', fontSize: 15),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.restaurant,
              size: 35,
            ),
            title: Text(
              'ห้องครัว',
              style: TextStyle(fontFamily: 'supermarket', fontSize: 15),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_basket,
              size: 35,
            ),
            title: Text(
              'หน้าร้าน',
              style: TextStyle(fontFamily: 'supermarket', fontSize: 15),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 35,
            ),
            title: Text(
              'ตั้งค่า',
              style: TextStyle(fontFamily: 'supermarket', fontSize: 15),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
