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
        scaffoldBackgroundColor: Colors.grey,
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

  final PageController _pageController = PageController();
  final ScrollController scrollController = ScrollController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'ร้านป้าทิพย์หน้าหอ',
          style: TextStyle(
              fontFamily: 'supermarket', fontSize: 30, color: Colors.black),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Container(
                    width: 80,
                    height: 20,
                    child: FlatButton(
                      onPressed: () {
                        _pageController.animateToPage(0,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.linear);
                      },
                      child: Text(
                        'เมนูแนะนำ',
                        style: TextStyle(
                            fontFamily: 'supermarket',
                            fontSize: 15,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Container(
                    width: 85,
                    height: 20,
                    child: FlatButton(
                      onPressed: () {
                        _pageController.animateToPage(1,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.linear);
                      },
                      child: Text(
                        'เมนูทั้งหมด',
                        style: TextStyle(
                            fontFamily: 'supermarket',
                            fontSize: 15,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Container(
                    width: 85,
                    height: 20,
                    child: FlatButton(
                      onPressed: () {
                        _pageController.animateToPage(2,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.linear);
                      },
                      child: Text(
                        'เครื่องดื่ม',
                        style: TextStyle(
                            fontFamily: 'supermarket',
                            fontSize: 15,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Container(
                    width: 85,
                    height: 20,
                    child: FlatButton(
                      onPressed: () {
                        _pageController.animateToPage(3,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.linear);
                      },
                      child: Text(
                        'ของกินเล่น',
                        style: TextStyle(
                            fontFamily: 'supermarket',
                            fontSize: 15,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              pageSnapping: true,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: 100,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Container(
                            color: Colors.white,
                            child: Text('page 0 item $index')),
                      );
                    },
                  ),
                ),
                Container(
                  color: Colors.lightBlue,
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: 100,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Text('page 1 item $index');
                    },
                  ),
                ),
                Container(
                  color: Colors.lightGreen,
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: 100,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Text('page 2 item $index');
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
