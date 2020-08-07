import 'package:flutter/material.dart';

dynamic showAlert(String title, String body, dynamic context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        backgroundColor: Colors.pink[300],
        title: new Text(title,
            style: TextStyle(
                fontFamily: 'supermarket',
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold)),
        content: new Text(body,
            style: TextStyle(
                fontFamily: 'supermarket', fontSize: 20, color: Colors.white)),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
  ;
}
