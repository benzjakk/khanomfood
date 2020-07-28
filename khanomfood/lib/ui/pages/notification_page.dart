import 'package:flutter/material.dart';

import 'package:khanomfood/ui/pages.dart';
import 'package:khanomfood/ui/widgets.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khanom Food',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NotificationPageChild(title: 'Khanom Food'),
    );
  }
}

class NotificationPageChild extends StatefulWidget {
  NotificationPageChild({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPageChild> {
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
          'Notification',
          style: TextStyle(fontFamily: 'Bubblegum', fontSize: 25),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'NotificationPage',
            ),
          ],
        ),
      ),
    );
  }
}
