import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit/json/user.dart';
import 'package:flutter_credit/pages/text_xml.dart';
import 'package:flutter_credit/service/service_request.dart';
import 'package:flutter_credit/utils/net_loading_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toast/toast.dart';
import 'dart:io';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'index_page.dart';
import 'package:flutter_credit/common/common.dart' as shared;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userName = TextEditingController(); //监听用户名
  TextEditingController passWord = TextEditingController(); //监听密码
  bool groupValue = true;
  Timer _timer;
  int _countdownTime = 0;

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
        body: FractionallySizedBox(
      alignment: Alignment.center,
      widthFactor: 1.0,
      heightFactor: 1.0,
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              // 触摸收起键盘
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Container(
              width: double.infinity,
              height: ScreenUtil().setHeight(1334),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'images/login_top.png',
                    width: ScreenUtil().setWidth(750),
                    fit: BoxFit.contain,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().width = 30),
                    width: ScreenUtil().setWidth(600),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _userNameTF(),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              _verification(),
                              _passWordTF(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  _login(),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[_tags(), _agreement()],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    ));
  }

  //阅读协议
  _agreement() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _radio(),
          Container(
            child: RichText(
              text: TextSpan(
                style: TextStyle(fontSize: ScreenUtil().setSp(22)),
                children: [
                  TextSpan(
                      text: '已阅读并同意',
                      style: TextStyle(color: Color(0xff1a1a1a))),
                  TextSpan(
                      text: '《注册服务协议》',
                      style: TextStyle(color: Color(0xffD5AB5B),),
                    recognizer:  TapGestureRecognizer()..onTap=(){//增加一个点击事件
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TextXml(tag: 1,),
                          ));
                    },),

                  TextSpan(
                    text: '《信用授权及使用协议》',
                    style: TextStyle(
                      color: Color(0xffD5AB5B),
                    ),
                    recognizer: TapGestureRecognizer()..onTap=(){//增加一个点击事件
                      print('111111');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TextXml(tag: 4,),
                          ));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _userNameTF() {
    return TextFormField(
      controller: userName,
      autovalidate: true,
      maxLength: 11,
      autofocus: false,
      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
      //键盘回车键的样式
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          border: InputBorder.none,
          labelText: '手机号',
          hintText: '请输入手机号码',
          icon: Icon(Icons.phone_android)),
      validator: (v) {
        return v.trim().length != 11 ? '手机号码错误' : null;
      },
    );
  }

  _tags() {
    return Container(
        width: double.infinity,
        child: Center(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: ScreenUtil().setHeight(1),
                  color: Color(0xffE6E5E5),
                ),
                flex: 1,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  '未注册用户将直接为您注册',
                  style: TextStyle(color: Color(0xff737373)),
                ),
              ),
              Expanded(
                child: Container(
                  height: ScreenUtil().setHeight(1),
                  color: Color(0xffE6E5E5),
                ),
                flex: 1,
              ),
            ],
          ),
        ));
  }

  _login() {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().width = 40),
      width: ScreenUtil().setWidth(500),
      height: ScreenUtil().setHeight(80),
      child: FlatButton(
        onPressed: () {
          if (this.groupValue) {
            if (userName.text.isNotEmpty && passWord.text.isNotEmpty) {
              _loginAndRegister();
            } else {
              Toast.show("手机号或者密码不为空", context,
                  duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
            }
          } else {
            Toast.show("请先阅读协议", context,
                duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
          }
        },
        child: Text(
          '登陆',
          style:
              TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(35)),
        ),
        color: Color(0xffd5ab58),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
    );
  }

  _radio() {
    return Checkbox(
      value: this.groupValue,
      activeColor: Colors.blue,
      onChanged: (bool val) {
        // val 是布尔值
        this.setState(() {
          this.groupValue = !this.groupValue;
        });
      },
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
          hintText: '验证码',
          icon: Icon(Icons.lock)),
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
            dismissDialog: _disMissCallBack,
            outsideDismiss: false,
          );
        });
  }

  //这个func 就是关闭Dialog的方法
  _disMissCallBack(Function func) {
    var formData = {'mobile': userName.text, 'regcode': "1"};
    getRequest('getLogincode', formData: formData).then((val) {
      func();
    });
  }

  //这个func 就是关闭Dialog的方法
  _disMissCallBackLogin(Function func) {
    var formData = {'mobile': userName.text, 'regcode': "1"};
    getRequest('getLogincode', formData: formData).then((val) {
      _postLogin(func);
    });
  }

  //登陆注册
  _loginAndRegister() {
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

  _postLogin(Function function) async {
    var formData;
    if (Platform.isIOS) {
      formData = {
        'mobile': userName.text,
        'regcode': "1",
        'code': passWord.text.trim(),
        'ncode': 'ios',
        'canel': '：iosqyb'
      };
    } else if (Platform.isAndroid) {
      formData = {
        'mobile': userName.text,
        'regcode': "1",
        'code': passWord.text.trim(),
        'ncode': 'android',
        'canel': '：ali'
      };
    }
    await postRequest('LoginAndRegister', formData: formData).then((val) {
      print(val);
      User user = User.fromJson(val);
      if (user.status == 200) {
        print('ś${user.data.uid}');
        save(user.data.token,user.data.mobile,user.data.uid);
        print(user.data.token);
        function();
        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => IndexPage(),
            ));
      } else {
        function();
        Toast.show(user.message, context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      }
    });
  }

  save(String loginState,String phone,String uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(shared.LOGIN_STATE, loginState);
    prefs.setString(shared.PHONE_STATE, phone);
    prefs.setString(shared.PHONE_UID, uid);
  }
}
