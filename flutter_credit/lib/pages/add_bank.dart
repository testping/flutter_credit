import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toast/toast.dart';
class AddBank extends StatefulWidget {
  @override
  _AddBankState createState() => _AddBankState();
}

class _AddBankState extends State<AddBank> {
  TextEditingController userName = TextEditingController(); //监听用户名
  TextEditingController passWord = TextEditingController(); //监听密码
  bool groupValue = true;
  Timer _timer;
  int _countdownTime = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            '添加银行卡',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.white,
          )),
      body: FractionallySizedBox(
        alignment: Alignment.center,
        widthFactor: 1.0,
        heightFactor: 1.0,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(15),
            width: double.infinity,
            height: ScreenUtil().setHeight(1334),
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: '持卡人姓名',
                    hintText: '姓名'
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: '身份证',
                      hintText: '请输入身份证'
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: '银行卡号',
                      hintText: '请输入银行卡号'
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: '手机号',
                      hintText: '银行预留手机号'
                  ),
                ),
               Container(
                 width: double.infinity,
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: <Widget>[
                     _verification(),
                     _passWordTF(),
                   ],
                 ),
               ),
                 Container(
                   margin: EdgeInsets.only(top: 10),
                  width: double.infinity,
                  height: ScreenUtil().setHeight(100),
                  color: Color(0xffD5AB5B),
                  child: FlatButton(onPressed: (){
                    
                  },child: Text('确定',style: TextStyle(color: Colors.white,fontSize: ScreenUtil().setSp(35)),),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _passWordTF() {
    return FlatButton(
        onPressed: () {
          if (RegExp(
              '^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$')
              .hasMatch(userName.text)) {
            if (_countdownTime == 0) {
              setState(() {
                _countdownTime = 30;
              });
              _startCountdownTimer();
            }
          } else {
            Toast.show("手机号码错误", context,
                duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
          }
        },
        child: Text(
          _countdownTime == 0 ? "发送验证码" : '剩余$_countdownTime',
          style: TextStyle(color: Color(0xffD5AB5B)),
        ));
  }

  _verification() {
    return Expanded(
        child: TextFormField(
          controller: passWord,
          decoration: InputDecoration(
              border: InputBorder.none,
              labelText: '验证码',
              hintText: '验证码'),
        ));
  }
  //开始倒计时验证码
  _startCountdownTimer() {
    const oneSec = const Duration(seconds: 1);
    var callback = (timer) => {
    setState(() {
      if (_countdownTime < 1) {
        _timer.cancel();
      } else {
        _countdownTime = _countdownTime - 1;
      }
    })
  };
    _timer = Timer.periodic(oneSec, callback);
  }

}
