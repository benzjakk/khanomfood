import 'package:flutter/material.dart';
import 'package:khanomfood/services/auth.dart';
import 'package:khanomfood/ui/pages.dart';
import 'package:khanomfood/ui/widgets.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SettingPageChild();
  }
}

class SettingPageChild extends StatefulWidget {
  SettingPageChild({Key key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPageChild> {
  final AuthService _auth = AuthService();
  bool isOpen = false;

  //mockupinfo
  String storeName = "ร้านป้าทิพย์หน้าหอ";
  String tel = "0912345678";
  String openTime = "ทุกวัน 06.00 - 19.00น";
  String address = "ตรงข้ามหอ AJ Mansion ลาดกระบัง กรุงเทพ 10520";
  int delivPrice = 20;
  String username = 'benzsport357';

  @override
  Widget build(BuildContext context) {
    setState(() {});
    double c_width = MediaQuery.of(context).size.width * 0.8;
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'โปรไฟล์',
            style: TextStyle(
                fontFamily: 'supermarket', fontSize: 30, color: Colors.black),
          ),
        ),
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  _showOnOffStore(),
                  _showNameTel(),
                  _showOpenTime(),
                  _showAddress(),
                  _showDelivPrice(),
                  _showUsername(),
                  Container(
                    width: c_width,
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: RaisedButton(
                        onPressed: () async {
                          print("siging out");
                          await _auth.signOut();
                        },
                        color: Colors.red[400],
                        child: Text(
                          "ออกจากระบบ",
                          style: bigWhite(),
                        )),
                  ),
                ],
              );
            }));
  }

  Container _showUsername() {
    return Container(
        color: Colors.white,
        alignment: Alignment.topLeft,
        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
        padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'username',
                  style: headGrey(),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(username, style: bodyBlack()),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'เปลี่ยนรหัสผ่าน',
                  style: headGrey(),
                ),
              ],
            ),
            IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  showAlert("editing", "editing", context);
                })
          ],
        ));
  }

  Container _showDelivPrice() {
    return Container(
        color: Colors.white,
        alignment: Alignment.topLeft,
        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
        padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ค่าจัดส่ง',
                  style: headGrey(),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(delivPrice.toString() + ' ฿', style: numPink())
              ],
            ),
            IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  showAlert("editing", "editing", context);
                })
          ],
        ));
  }

  Container _showAddress() {
    return Container(
        color: Colors.white,
        alignment: Alignment.topLeft,
        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
        padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ที่อยู่',
                    style: headGrey(),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    address,
                    style: bodyBlack(),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  showRaisedButton(
                      "แผนที่",
                      Colors.pink[300],
                      Icon(
                        Icons.map,
                        color: Colors.white,
                      ),
                      110)
                ],
              ),
            ),
            IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  showAlert("editing", "editing", context);
                })
          ],
        ));
  }

  Container _showOpenTime() {
    return Container(
        color: Colors.white,
        alignment: Alignment.topLeft,
        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
        padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'เวลาเปิดร้าน',
                  style: headGrey(),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(openTime, style: bodyBlack())
              ],
            ),
            IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  showAlert("editing", "editing", context);
                })
          ],
        ));
  }

  Container _showNameTel() {
    return Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
        padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ชื่อร้าน',
                  style: headGrey(),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(storeName, style: bodyBlack()),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'เบอร์โทร',
                  style: headGrey(),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(tel, style: bodyBlack()),
              ],
            ),
            IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  showAlert("editing", "editing", context);
                })
          ],
        ));
  }

  Container _showOnOffStore() {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("เปิด-ปิดร้าน", style: bodyBlack()),
          Switch(
              value: isOpen,
              activeColor: Colors.green,
              onChanged: (value) {
                setState(() {
                  isOpen = !isOpen;
                });
              }),
        ],
      ),
    );
  }
}
