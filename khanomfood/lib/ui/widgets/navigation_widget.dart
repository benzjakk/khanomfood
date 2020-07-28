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
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Khanom Food'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.pink,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text('Notification'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            title: Text('Kitchen'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            title: Text('Shop'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Setting'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
