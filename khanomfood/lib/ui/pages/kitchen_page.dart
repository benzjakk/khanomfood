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

class _KitchenPageState extends State<KitchenPageChild> {
  final PageController _pageController = PageController();

  List<Color> selectedColors = [Colors.pink]
    ..addAll(List.filled(4, Colors.black));
  SelectorBar selectorBar = SelectorBar(['กำลังทำ', 'จัดส่ง', 'เสร็จสิ้น']);
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
    OrderList(113, [MenuDetail("ข้าวมันไก่", 3)], false, ""),
    OrderList(113, [MenuDetail("ข้าวมันไก่", 3)], false, ""),
    OrderList(113, [MenuDetail("ข้าวมันไก่", 3)], false, ""),
  ];

  @override
  Widget build(BuildContext context) {
    selectorBar.UpdateSelectedColors(selectedColors);
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
          selectorBar.DisplaySelectorBar(),
          Expanded(
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  selectedColors = ChangeSelectedColor(index, 5);
                });
              },
              controller: selectorBar.GetPagecontroller(),
              pageSnapping: true,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                DisplayOrderList(orderLists),
                DisplayOrderList(orderLists),
                DisplayOrderList(orderLists),
              ],
            ),
          ),
        ]));
  }
}
