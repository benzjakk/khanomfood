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
  final List<String> entries = <String>['1', '2', '3'];
  bool noti = true;
  Color notiColor = Colors.pink;
  Color hisColor = Colors.black;

  void notiPress() {
    setState(() {
      noti = true;
      notiColor = Colors.pink;
      hisColor = Colors.black;
    });
  }

  void hisPress() {
    setState(() {
      noti = false;
      notiColor = Colors.black;
      hisColor = Colors.pink;
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
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'ยอดขายวันนี้',
                        style:
                            TextStyle(fontFamily: 'supermarket', fontSize: 20),
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
                        onPressed: notiPress,
                        child: Text(
                          'แจ้งเตือน',
                          style: TextStyle(
                              fontFamily: 'supermarket',
                              fontSize: 20,
                              color: notiColor),
                        ),
                      ),
                      FlatButton(
                        onPressed: hisPress,
                        child: Text(
                          'ประวัติ',
                          style: TextStyle(
                              fontFamily: 'supermarket',
                              fontSize: 20,
                              color: hisColor),
                        ),
                      ),
                    ]),
                  ],
                )
              ],
            ),
          ),
          StreamBuilder(
              builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
            if (noti) {
              return notification(context);
            } else {
              return history(context);
            }
          })
        ],
      ),
    );
  }

  Widget notification(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Container(
                  height: 150,
                  color: Colors.white,
                  child: Center(child: Text('Entry ${entries[index]}')),
                ),
              );
            }));
  }

  Widget history(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Container(
                  height: 50,
                  color: Colors.white,
                  child: Center(child: Text('Entry ${entries[index]}')),
                ),
              );
            }));
  }
}
