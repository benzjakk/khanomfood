import 'package:flutter/material.dart';
import 'package:khanomfood/services/auth.dart';
import 'package:khanomfood/ui/pages.dart';
import 'package:khanomfood/ui/widgets.dart';

class RegisterPage extends StatefulWidget {
  final Function toggleView;
  RegisterPage({this.toggleView});
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';
  String password2 = '';
  Widget _DisplayPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          ' Password',
          style: TextStyle(
              color: Colors.white, fontFamily: 'supermarket', fontSize: 18),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.pink[200],
            borderRadius: BorderRadius.circular(10),
          ),
          width: 300,
          child: TextField(
            onChanged: (val) {
              setState(() {
                password = val;
              });
            },
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'supermarket',
            ),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 20),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                border: InputBorder.none,
                hintText: 'กรุณากรอก Password',
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: 'supermarket',
                )),
          ),
        ),
      ],
    );
  }

  Widget _DisplayRepasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Re-enter Password',
          style: TextStyle(
              color: Colors.white, fontFamily: 'supermarket', fontSize: 18),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.pink[200],
            borderRadius: BorderRadius.circular(10),
          ),
          width: 300,
          child: TextField(
            onChanged: (val) {
              setState(() {
                password2 = val;
              });
            },
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'supermarket',
            ),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 20),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                border: InputBorder.none,
                hintText: 'กรุณากรอก Password อีกครั้ง',
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: 'supermarket',
                )),
          ),
        ),
      ],
    );
  }

  Widget _DisplayEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(' Email',
            style: TextStyle(
                color: Colors.white, fontFamily: 'supermarket', fontSize: 18)),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.pink[200],
            borderRadius: BorderRadius.circular(10),
          ),
          width: 300,
          child: TextField(
            onChanged: (val) {
              setState(() {
                email = val;
              });
            },
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'supermarket',
            ),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 20),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                border: InputBorder.none,
                hintText: 'กรุณากรอก Email',
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: 'supermarket',
                )),
          ),
        ),
      ],
    );
  }

  Widget _DisplayRegisBT() {
    return ButtonTheme(
      minWidth: 300,
      child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.white,
          onPressed: () async {
            print(email);
            print(password);
            print(password2);
          },
          child: Text("สมัครสมาชิก",
              style: TextStyle(
                  fontFamily: 'supermarket',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink[300]))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
              0.1,
              0.6,
              0.9,
            ],
                colors: [
              Colors.pink[200],
              Colors.pink[300],
              Colors.pink[400],
            ])),
      ),
      Container(),
      ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 80,
                ),
                Center(
                  child: Text("Khanom",
                      style: TextStyle(
                          fontFamily: 'Righteous',
                          fontSize: 50,
                          color: Colors.white)),
                ),
                SizedBox(
                  height: 30,
                ),
                _DisplayEmailTF(),
                SizedBox(
                  height: 20,
                ),
                _DisplayPasswordTF(),
                SizedBox(
                  height: 20,
                ),
                _DisplayRepasswordTF(),
                SizedBox(
                  height: 20,
                ),
                _DisplayRegisBT(),
                SizedBox(
                  height: 5,
                ),
                FlatButton(
                  onPressed: () {
                    widget.toggleView();
                  },
                  child: Text(
                    "มีบัญชีแล้ว?",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'supermarket',
                    ),
                  ),
                )
              ],
            );
          }),
    ]));
  }
}
