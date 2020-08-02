import 'package:flutter/material.dart';

import 'package:khanomfood/ui/pages.dart';
import 'package:khanomfood/ui/widgets.dart';

class KitchenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return KitchenPageChild();
  }
}

class KitchenPageChild extends StatefulWidget {
  KitchenPageChild({Key key}) : super(key: key);

  @override
  _KitchenPageState createState() => _KitchenPageState();
}

class OrderList {
  bool _delivery;
  int _orderNo;
  String _address;
  List<MenuDetail> _menuDetails;
  OrderList(this._orderNo, this._menuDetails, this._delivery, this._address);
}

class MenuDetail {
  String _menuName;
  int _menuCount;
  MenuDetail(this._menuName, this._menuCount);
}

class _KitchenPageState extends State<KitchenPageChild> {
  final PageController _pageController = PageController();
  Color _color1 = Colors.pink;
  Color _color2 = Colors.black;
  Color _color3 = Colors.black;
  Color _color4 = Colors.black;
  Color _color5 = Colors.black;

  List<OrderList> orderLists = [
    OrderList(
        112,
        [
          MenuDetail("ข้าวมันไก่", 1),
          MenuDetail("ข้าวต้ม", 2),
        ],
        true,
        "AJ Mansion"),
    OrderList(113, [MenuDetail("ข้าวมันไก่", 3)], true, "AJ Park"),
    OrderList(113, [MenuDetail("ข้าวมันไก่", 3)], false, ""),
  ];

  List<Widget> DisplayMenu(List<MenuDetail> menus) {
    return menus
        .map((menu) => Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(
                "${menu._menuName} x ${menu._menuCount} ",
                style: TextStyle(
                    fontFamily: 'supermarket',
                    fontSize: 26,
                    color: Colors.black),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'ห้องครัว',
            style: TextStyle(
                fontFamily: 'supermarket', fontSize: 30, color: Colors.black),
          ),
        ),
        body: Column(children: <Widget>[
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 80,
                  height: 20,
                  child: FlatButton(
                    onPressed: () {
                      _pageController.animateToPage(0,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.linear);
                    },
                    child: Text(
                      'ทั้งหมด',
                      style: TextStyle(
                          fontFamily: 'supermarket',
                          fontSize: 15,
                          color: _color1),
                    ),
                  ),
                ),
                Container(
                  width: 80,
                  height: 20,
                  child: FlatButton(
                    onPressed: () {
                      _pageController.animateToPage(1,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.linear);
                    },
                    child: Text(
                      'เตรียม',
                      style: TextStyle(
                          fontFamily: 'supermarket',
                          fontSize: 15,
                          color: _color2),
                    ),
                  ),
                ),
                Container(
                  width: 80,
                  height: 20,
                  child: FlatButton(
                    onPressed: () {
                      _pageController.animateToPage(2,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.linear);
                    },
                    child: Text(
                      'กำลังทำ',
                      style: TextStyle(
                          fontFamily: 'supermarket',
                          fontSize: 15,
                          color: _color3),
                    ),
                  ),
                ),
                Container(
                  width: 80,
                  height: 20,
                  child: FlatButton(
                    onPressed: () {
                      _pageController.animateToPage(3,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.linear);
                    },
                    child: Text(
                      'ส่งมอบ',
                      style: TextStyle(
                          fontFamily: 'supermarket',
                          fontSize: 15,
                          color: _color4),
                    ),
                  ),
                ),
                Container(
                  width: 80,
                  height: 20,
                  child: FlatButton(
                    onPressed: () {
                      _pageController.animateToPage(4,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.linear);
                    },
                    child: Text(
                      'เสร็จสิ้น',
                      style: TextStyle(
                          fontFamily: 'supermarket',
                          fontSize: 15,
                          color: _color5),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              onPageChanged: (index) {
                if (index == 0) {
                  setState(() {
                    _color1 = Colors.pink;
                    _color2 = Colors.black;
                    _color3 = Colors.black;
                    _color4 = Colors.black;
                    _color5 = Colors.black;
                  });
                } else if (index == 1) {
                  setState(() {
                    _color1 = Colors.black;
                    _color2 = Colors.pink;
                    _color3 = Colors.black;
                    _color4 = Colors.black;
                    _color5 = Colors.black;
                  });
                } else if (index == 2) {
                  setState(() {
                    _color1 = Colors.black;
                    _color2 = Colors.black;
                    _color3 = Colors.pink;
                    _color4 = Colors.black;
                    _color5 = Colors.black;
                  });
                } else if (index == 3) {
                  setState(() {
                    _color1 = Colors.black;
                    _color2 = Colors.black;
                    _color3 = Colors.black;
                    _color4 = Colors.pink;
                    _color5 = Colors.black;
                  });
                } else if (index == 4) {
                  setState(() {
                    _color1 = Colors.black;
                    _color2 = Colors.black;
                    _color3 = Colors.black;
                    _color4 = Colors.black;
                    _color5 = Colors.pink;
                  });
                }
              },
              controller: _pageController,
              pageSnapping: true,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  child: ListView.builder(
                    itemCount: orderLists.length,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.white,
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "รายการที่ ${orderLists[index]._orderNo}",
                                    style: TextStyle(
                                        fontFamily: 'supermarket',
                                        fontSize: 22,
                                        color: Colors.grey),
                                  ),
                                ]..addAll(DisplayMenu(
                                    orderLists[index]._menuDetails))),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  if (orderLists[index]._delivery)
                                    Icon(Icons.motorcycle)
                                  else
                                    Icon(Icons.store),
                                  RaisedButton(
                                    onPressed: () {},
                                    color: Colors.green,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 5, 0, 0),
                                            child: Text(
                                              'ขั้นตอนต่อไป',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'supermarket',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  child: ListView.builder(
                    itemCount: orderLists.length,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.white,
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "รายการที่ ${orderLists[index]._orderNo}",
                                    style: TextStyle(
                                        fontFamily: 'supermarket',
                                        fontSize: 22,
                                        color: Colors.grey),
                                  ),
                                ]..addAll(DisplayMenu(
                                    orderLists[index]._menuDetails))),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  if (orderLists[index]._delivery)
                                    Icon(Icons.motorcycle)
                                  else
                                    Icon(Icons.store),
                                  RaisedButton(
                                    onPressed: () {},
                                    color: Colors.green,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 5, 0, 0),
                                            child: Text(
                                              'ขั้นตอนต่อไป',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'supermarket',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  child: ListView.builder(
                    itemCount: 10,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(child: Text('page 2 item $index'));
                    },
                  ),
                ),
                Container(
                  child: ListView.builder(
                    itemCount: 10,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(child: Text('page 3 item $index'));
                    },
                  ),
                ),
                Container(
                  child: ListView.builder(
                    itemCount: 10,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(child: Text('page 4 item $index'));
                    },
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
