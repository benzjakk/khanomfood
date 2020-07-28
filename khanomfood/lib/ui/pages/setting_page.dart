import 'package:flutter/material.dart';

import 'package:khanomfood/ui/pages.dart';
import 'package:khanomfood/ui/widgets.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khanom Food',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SettingPageChild(title: 'Khanom Food'),
    );
  }
}

class SettingPageChild extends StatefulWidget {
  SettingPageChild({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPageChild> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Setting',
          style: TextStyle(fontFamily: 'Bubblegum', fontSize: 25),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'SettingPage',
            ),
          ],
        ),
      ),
    );
  }
}
