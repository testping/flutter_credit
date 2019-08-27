import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'add_bank.dart';

class MyBank extends StatefulWidget {
  @override
  _MyBankState createState() => _MyBankState();
}

class _MyBankState extends State<MyBank> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
        appBar: AppBar(
            title: Text(
              '我的银行卡',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            iconTheme: IconThemeData(
              color: Colors.white,
            )),
        body: FractionallySizedBox(
          widthFactor: 1.0,
          heightFactor: 1.0,
          alignment: Alignment.center,
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text('无绑定银行卡'),
                ),
                Image.asset('images/no_bank.png'),
                _addBank()
              ],
            ),
          ),
        ));
  }

  //添加银行卡按钮
  _addBank() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      color: Color(0xffD5AB5B),
      height: ScreenUtil().setHeight(100),
      width: double.infinity,
      child: MaterialButton(
        height: ScreenUtil().setHeight(100),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>
              AddBank()));
        },
        child: Text(
          '添加银行卡',
          style:
              TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(33)),
        ),
      ),
    );
  }
}
