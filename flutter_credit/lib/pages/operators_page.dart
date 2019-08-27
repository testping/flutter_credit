import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit/json/entity.dart';
import 'package:flutter_credit/service/service_request.dart';
import 'package:flutter_credit/utils/net_loading_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toast/toast.dart';

import 'assessment_page.dart';
class OperatorsPage extends StatefulWidget {
  @override
  _OperatorsPageState createState() => _OperatorsPageState();
}

class _OperatorsPageState extends State<OperatorsPage> {

  TextEditingController userName = TextEditingController(); //监听手机
  TextEditingController passWord = TextEditingController(); //监听验证码

  Timer _timer;
  int _countdownTime = 0;
  @override
  void dispose() {
    super.dispose();
    if(_timer!=null){
      _timer.cancel();
    }
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(
            '手机运营商',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.white,
          )),
      body:  SingleChildScrollView(
          child: Container(
            height: ScreenUtil().setHeight(1150),
            child:
            Column(
              children: <Widget>[
                _infoPro(),
                _yysTags(),
                _yysInfo(),
                Expanded(child: Container(
                  color: Colors.white,
                  alignment: Alignment.bottomCenter,
                  child:  MaterialButton(
                    onPressed: () {
                      _OperatorsJC();
                    },
                    height: ScreenUtil().setHeight(100),
                    minWidth: double.infinity,
                    color: Color(0xffD5AB5B),
                    child: Text('立刻评估额度',style: TextStyle(color: Colors.white,fontSize: ScreenUtil().setSp(35)),),
                  ),
                ))
              ],
            ),
          )
        ),

    );
  }

  //信息进度条
  _infoPro() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 10),
      child: Image.asset('images/three.png'),
    );
  }

  //介绍和图标
  _yysTags() {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: ScreenUtil().setHeight(400),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Image.asset('images/yyslogo.png'),
          Padding(padding: EdgeInsets.only(top: 8),child:
          Text('需认证号码真实性',style: TextStyle(color: Color(0xff737373)),),),
          Padding(padding: EdgeInsets.only(top: 8),child:
          Text('各环节多重加密,防范泄露危险',style: TextStyle(color: Color(0xff737373)),),),
        ],
      ),
    );
  }
  //运营商认证
  _yysInfo(){
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: EdgeInsets.only(left: 20,right: 20),
      child: Column(
        children: <Widget>[
          Divider(
            height: ScreenUtil().setHeight(10),
            color: Color(0xfffafafa),
          ),
          Container(
            width:  double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    controller: userName,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      labelText:'手机号',
                        hintText: '请输入手机号',
                        border: InputBorder.none),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
          ),
          _yysCode(),
          Divider(
            height: 1,
          ),
        ],
      ),
    );
  }
  //获取验证码
  _yysCode(){
    return Row(
      children: <Widget>[
        _verification(),
        _passWordTF(),
      ],
    );
  }


  _passWordTF() {
    return FlatButton(
        onPressed: () {
          if (RegExp(
              '^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$')
              .hasMatch(userName.text)) {
            if (_countdownTime == 0) {
              _getUserCode();
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
          inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
          //键盘回车键的样式
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
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

  //获取验证码
  _getUserCode() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return new NetLoadingDialog(
            dismissDialog:_disMissCallBack,
            outsideDismiss: false,
          );
        });
  }
  //这个func 就是关闭Dialog的方法
  _disMissCallBack(Function func) {
    var formData = {'mobile': userName.text};
    getRequest('operators', formData: formData).then((val) {
      func();
    });

  }

  //运营商检测
  _OperatorsJC() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return new NetLoadingDialog(
            dismissDialog: _disMissCallBackLogin,
            outsideDismiss: false,
          );
        });
  }

  //这个func 运营商检测关闭
  _disMissCallBackLogin(Function func) {
    var formData = {'mobile': userName.text, 'code': passWord.text};
    getRequest('operatorsLogin', formData: formData).then((val) {
      print(val);
      Entity entity = Entity.fromJson(val);
      if(entity.status==200){
        func();
        Navigator.push(context, MaterialPageRoute(builder: (context)=>
            AssessmentPage()));

      }
    });
  }

}
