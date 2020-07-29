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
        scaffoldBackgroundColor: Colors.grey,
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
          'Khanom',
          style: TextStyle(fontFamily: 'Righteous', fontSize: 35),
        ),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.white,
              height: 155,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'ยอดขายวันนี้',
                          style: TextStyle(
                              fontFamily: 'supermarket', fontSize: 20),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'ขณะนี้ร้านกำลังเปิดอยู่',
                          style: TextStyle(
                              fontFamily: 'supermarket',
                              fontSize: 15,
                              color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                  Table(
                    children: [
                      TableRow(children: [
                        Center(
                          child: Text(
                            '1520',
                            style: TextStyle(
                                fontFamily: 'supermarket',
                                fontSize: 50,
                                color: Colors.pink),
                          ),
                        ),
                        Center(
                          child: Text(
                            '46',
                            style: TextStyle(
                                fontFamily: 'supermarket',
                                fontSize: 50,
                                color: Colors.pink),
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Center(
                          child: Text(
                            'บาท',
                            style: TextStyle(
                                fontFamily: 'supermarket',
                                fontSize: 20,
                                color: Colors.black),
                          ),
                        ),
                        Center(
                          child: Text(
                            'ครั้ง',
                            style: TextStyle(
                                fontFamily: 'supermarket',
                                fontSize: 20,
                                color: Colors.black),
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        FlatButton(
                          onPressed: () => {},
                          child: Text(
                            'แจ้งเตือน',
                            style: TextStyle(
                                fontFamily: 'supermarket',
                                fontSize: 20,
                                color: Colors.pink),
                          ),
                        ),
                        FlatButton(
                          onPressed: () => {},
                          child: Text(
                            'ประวัติ',
                            style: TextStyle(
                                fontFamily: 'supermarket',
                                fontSize: 20,
                                color: Colors.black),
                          ),
                        ),
                      ]),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
