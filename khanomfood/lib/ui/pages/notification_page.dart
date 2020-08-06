import 'package:flutter/material.dart';

import 'package:khanomfood/ui/pages.dart';
import 'package:khanomfood/ui/widgets.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NotificationPageChild();
  }
}

class NotificationPageChild extends StatefulWidget {
  NotificationPageChild({Key key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPageChild> {
  List<String> entries = <String>['1', '2', '3'];
  List<String> menu = <String>[
    'ข้าวมันไก่ x 1 50฿',
    'ข้าวไข่เจียว x 2 100฿\nแกงจืดหมูสับ x 1 60฿',
    'ข้าวไข่เจียว x 2 100฿',
  ];
  List<Icon> ic = <Icon>[
    Icon(
      Icons.motorcycle,
      size: 50,
    ),
    Icon(
      Icons.store,
      size: 50,
    ),
  ];
  List<int> icn = <int>[0, 0, 1];
  List<String> where = <String>[
    'AJ Mansion 653/11 ลาดกระบัง กรุงเทพ 10520',
    'AJ Mansion 653/11 ลาดกระบัง กรุงเทพ 10520',
    'มารับที่ร้าน',
  ];
  List<int> price = <int>[50, 160, 100];

  Color notiColor = Colors.pink;
  Color hisColor = Colors.black;

  final PageController _pageController = PageController();
  final ScrollController _scrollController = ScrollController();

  void notiPress() {
    setState(() {
      _pageController.animateToPage(0,
          duration: Duration(milliseconds: 200), curve: Curves.linear);
    });
  }

  void hisPress() {
    setState(() {
      _pageController.animateToPage(1,
          duration: Duration(milliseconds: 200), curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Khanom',
          style: TextStyle(
              fontFamily: 'Righteous', fontSize: 35, color: Colors.white),
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
          Expanded(
            child: PageView(
              controller: _pageController,
              pageSnapping: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                if (index == 0)
                  setState(() {
                    notiColor = Colors.pink;
                    hisColor = Colors.black;
                  });
                else
                  setState(() {
                    notiColor = Colors.black;
                    hisColor = Colors.pink;
                  });
              },
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 1, 0, 0),
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: entries.length,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                        padding: EdgeInsets.all(8),
                        color: Colors.white,
                        child: Stack(children: <Widget>[
                          Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    'รายการที่ ${entries[index]}',
                                    style: TextStyle(
                                        fontFamily: 'supermarket',
                                        fontSize: 15,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    '${menu[index]}',
                                    style: TextStyle(
                                        fontFamily: 'supermarket',
                                        fontSize: 25,
                                        color: hisColor),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    'สถานที่จัดส่ง',
                                    style: TextStyle(
                                        fontFamily: 'supermarket',
                                        fontSize: 15,
                                        color: Colors.grey),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    '${where[index]}',
                                    style: TextStyle(
                                      fontFamily: 'supermarket',
                                      fontSize: 15,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    width: 70.0,
                                    height: 30.0,
                                    child: OutlineButton(
                                      onPressed: () => {},
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(30.0)),
                                      borderSide: BorderSide(
                                          width: 1.0, style: BorderStyle.solid),
                                      child: Text(
                                        'แผนที่',
                                        style: TextStyle(
                                          fontFamily: 'supermarket',
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    'รวม ${price[index]}฿',
                                    style: TextStyle(
                                      fontFamily: 'supermarket',
                                      fontSize: 35,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: ic[icn[index]],
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: ButtonBar(
                                children: <Widget>[
                                  RaisedButton(
                                    onPressed: () => {},
                                    color: Colors.green,
                                    child: Text(
                                      'ยอมรับ',
                                      style: TextStyle(
                                        fontFamily: 'supermarket',
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  RaisedButton(
                                    onPressed: () => {},
                                    color: Colors.red,
                                    child: Text(
                                      'ปฎิเสธ',
                                      style: TextStyle(
                                        fontFamily: 'supermarket',
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ]),
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 1, 0, 0),
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: entries.length,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                                  child: Text(
                                    'รายการที่ 1',
                                    style: TextStyle(
                                        fontFamily: 'supermarket',
                                        fontSize: 15,
                                        color: Colors.grey),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                  child: Icon(
                                    Icons.motorcycle,
                                    size: 30,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.all(5),
                                  child: Text(
                                    'ข้าสสสสสส',
                                    style: TextStyle(
                                      fontFamily: 'supermarket',
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                                  child: Text(
                                    'รวม 160฿',
                                    style: TextStyle(
                                      fontFamily: 'supermarket',
                                      fontSize: 20,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
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
