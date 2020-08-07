import 'package:flutter/material.dart';
import 'package:khanomfood/services/auth.dart';
import 'package:khanomfood/ui/pages.dart';
import 'package:khanomfood/ui/widgets.dart';

InputDecoration GetTFdecoration(String hintT) {
  return InputDecoration(
      filled: true,
      fillColor: Colors.pink[200],
      errorBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow)),
      errorStyle: TextStyle(color: Colors.yellow, fontFamily: 'supermarket'),
      contentPadding: EdgeInsets.only(top: 20),
      prefixIcon: Icon(
        Icons.email,
        color: Colors.white,
      ),
      border: InputBorder.none,
      hintText: hintT,
      hintStyle: TextStyle(
        color: Colors.white,
        fontFamily: 'supermarket',
      ));
}

class RegisterPage extends StatefulWidget {
  final Function toggleView;
  RegisterPage({this.toggleView});
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String email2 = 'test12345@gmail.com';
  String password = '';
  String password2 = '';
  String error = '';
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
            borderRadius: BorderRadius.circular(10),
          ),
          width: 300,
          child: TextFormField(
              validator: (val) => val.length < 6
                  ? 'กรุณาใส่ password ยาวกว่า 6 ตัวอักษร'
                  : null,
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
              decoration: GetTFdecoration("กรุณากรอก Password")),
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
            borderRadius: BorderRadius.circular(10),
          ),
          width: 300,
          child: TextFormField(
              validator: (val) => val.length < 6
                  ? 'กรุณาใส่ password ยาวกว่า 6 ตัวอักษร'
                  : null,
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
              decoration: GetTFdecoration("กรุณากรอก Password อีกครั้ง")),
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
            borderRadius: BorderRadius.circular(10),
          ),
          width: 300,
          child: TextFormField(
              onChanged: (val) {
                setState(() {
                  email = val;
                });
              },
              validator: (val) => val.isEmpty ? 'กรุณาใส่ email' : null,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'supermarket',
              ),
              decoration: GetTFdecoration("กรุณากรอก Email")),
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
            if (_formKey.currentState.validate()) {
              if (password == password2) {
                dynamic result =
                    await _auth.registerWithEmailAndPassword(email, password);
                if (result == null) {
                  showAlert(
                      "ผิดพลาด", "รูปแบบ Email ไม่ถูกต้องหรือซ้ำกัน", context);
                  setState(() {
                    error = 'Please supply a valid email';
                  });
                } else {
                  showAlert("สำเร็จ", "กรุณายืนยัน Email ต่อไป", context);
                }
              } else {
                showAlert(
                    "ผิดพลาด", "กรุณากรอก Password ให้เหมือนกัน", context);
              }
            }
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
            return Form(
              key: _formKey,
              child: Column(
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
              ),
            );
          }),
    ]));
  }
}
