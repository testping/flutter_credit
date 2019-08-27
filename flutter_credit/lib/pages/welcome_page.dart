import 'dart:async';

import 'package:flutter/material.dart';

import 'login_page.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  Timer timer;
  @override
  void initState() {
    super.initState();
    timer = new Timer(const Duration(milliseconds: 2000), () {
      try {
        Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(
            builder: (BuildContext context) => new LoginPage()), (//跳转到主页
            Route route) => route == null);
      } catch (e) {

      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FractionallySizedBox(
        widthFactor: 1.0,
        heightFactor: 1.0,
        alignment: Alignment.center,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image.asset('images/logo.png'),
              Text('万分期待',style: TextStyle(color: Color(0xffD5AB5B),fontSize: 30,fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }
}
