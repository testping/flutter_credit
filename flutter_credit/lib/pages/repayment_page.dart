import 'package:flutter/material.dart';

class RepaymentPage extends StatefulWidget {
  @override
  _RepaymentPageState createState() => _RepaymentPageState();
}

class _RepaymentPageState extends State<RepaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('万分期贷',style: TextStyle(color: Colors.white),),
        automaticallyImplyLeading: false,

      ),
      body: Container(
        alignment: Alignment.center,
        child: Image.asset('images/zanwu.png'),
      ),
    );
  }
}
