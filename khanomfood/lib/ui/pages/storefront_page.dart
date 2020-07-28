import 'package:flutter/material.dart';

import 'package:khanomfood/ui/pages.dart';
import 'package:khanomfood/ui/widgets.dart';

class StorefrontPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khanom Food',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StorefrontPageChild(title: 'Khanom Food'),
    );
  }
}

class StorefrontPageChild extends StatefulWidget {
  StorefrontPageChild({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StorefrontPageState createState() => _StorefrontPageState();
}

class _StorefrontPageState extends State<StorefrontPageChild> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'StorefrontPage',
            ),
          ],
        ),
      ),
    );
  }
}
