import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink[100],
      child: Center(
        child: SpinKitChasingDots(
          color: Colors.pink[300],
          size: 50.0,
        ),
      ),
    );
  }
}
