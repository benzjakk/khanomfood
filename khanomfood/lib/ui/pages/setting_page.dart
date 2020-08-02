import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
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
    );
  }
}
