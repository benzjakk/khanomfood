import 'package:flutter/material.dart';

import 'package:khanomfood/ui/pages.dart';
import 'package:khanomfood/ui/widgets.dart';

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

List<Widget> DisplayMenu(List<MenuDetail> menus) {
  return menus
      .map((menu) => Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(
              "${menu._menuName} x ${menu._menuCount} ",
              style: bodyBlack(),
            ),
          ))
      .toList();
}

Container DisplayOrderList(List orderLists) {
  return Container(
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
                      style: headGrey(),
                    ),
                  ]..addAll(DisplayMenu(orderLists[index]._menuDetails))),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    if (orderLists[index]._delivery)
                      Icon(Icons.motorcycle)
                    else
                      Icon(Icons.store),
                    showRaisedButton(
                        "ขั้นตอนต่อไป",
                        Colors.green,
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                        0)
                  ]),
            ],
          ),
        );
      },
    ),
  );
}

List<Color> ChangeSelectedColor(int index, int n) {
  List<Color> resultColors = [];
  for (int i = 0; i < n; i++) {
    if (i == index)
      resultColors.add(Colors.pink);
    else
      resultColors.add(Colors.black);
  }
  return resultColors;
}
