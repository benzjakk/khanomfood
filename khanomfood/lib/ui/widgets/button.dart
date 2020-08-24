import 'package:flutter/material.dart';

Container showRaisedButton(String text, Color color, Icon icon, double w) {
  return Container(
    width: w == 0 ? null : w,
    child: RaisedButton(
      onPressed: () {},
      color: color,
      child: Padding(
        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'supermarket',
                  color: Colors.white,
                ),
              ),
            ),
            icon
          ],
        ),
      ),
    ),
  );
}
