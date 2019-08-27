import 'dart:math';
import 'package:flutter_credit/common/common.dart' as shared;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'add_bank.dart';

class QuotaPage extends StatefulWidget {
  @override
  _QuotaPageState createState() => _QuotaPageState();
}

class _QuotaPageState extends State<QuotaPage> {
  @override
  void initState() {
    super.initState();
    save("1");
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(
            '专属额度',
            style: TextStyle(color: Colors.white),
          ),
          elevation: 0.0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.white,
          )),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  height: ScreenUtil().setHeight(180),
                  decoration: BoxDecoration(
                      color: Color(0xffD5AB5B),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(7),
                          bottomRight: Radius.circular(7))),
                ),
                _top()
              ],
            ),
            _noBank(),
            _btnAddBank()
          ],
        ),
      ),
    );
  }

  _btnAddBank(){
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      height: ScreenUtil().setHeight(100),
      color:  Color(0xffD5AB5B),
      child: MaterialButton(onPressed: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    AddBank()));
      },child: Text('+ 添加银行卡',style: TextStyle(color: Colors.white,fontSize: ScreenUtil().setSp(32)),),),
    );
  }

  _top() {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      width: ScreenUtil().setWidth(650),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              '恭喜您通过本平台初审!',
              style: TextStyle(fontSize: ScreenUtil().setSp(33)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              '借款预估额度',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(30), color: Color(0xff737373)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              '¥ 3000',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(88),
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1a1a1a)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              '此额度为预估额度,具体金额以最终申请结果为准',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(24), color: Color(0xff737373)),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 2),
        ],
      ),
    );
  }

  //没哟银行卡哟
  _noBank() {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              '无绑定银行卡',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(30),
                color: Color(0xff737373),
              ),
            ),
          ),
          Container(
            child: Image.asset('images/no_bank.png'),
          )
        ],
      ),
    );
  }


  save(String infoState) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(shared.INFO_STATE, infoState);
  }
}
