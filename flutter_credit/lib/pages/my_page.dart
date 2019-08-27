import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_credit/pages/report_page.dart';
import 'package:flutter_credit/pages/setting_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_credit/common/common.dart' as shared;
import 'agreement_page.dart';
import 'kefu_page.dart';
import 'login_page.dart';
import 'my_bank.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  var username = "未登陆";

  @override
  void initState() {
    super.initState();
    _phoneState();
  }

  _phoneState() async {
    final phoneState = await SharedPreferences.getInstance();
    final phone = phoneState.getString(shared.PHONE_STATE ?? "");
    if (phone == null || phone.length == null || phone.length != 11)
      return username = "未登陆";
    setState(() {
      username = phone;
    });
  }

  @override
  void deactivate() {
    super.deactivate();
    _phoneState();
    print('手机zhuantai$username');
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return SingleChildScrollView(
      child: Container(
        width: ScreenUtil().setWidth(750),
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: ScreenUtil().setHeight(370),
                      child: Image.asset(
                        'images/my_top.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(child: _topImg()),
                  ],
                ),
                _inkList()
              ],
            )),
      ),
    );
  }

  //头部内容
  _topImg() {
    return SafeArea(
        child: Container(
      height: ScreenUtil().setHeight(370),
      child: Column(
        children: <Widget>[
          GestureDetector(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    showCupertinoDialog();
                  },
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.only(right: ScreenUtil().width = 18),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Image.asset('images/kefu.png'),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(right: ScreenUtil().width = 15),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            '客服',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(22)),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          _headImg(),
//          _bottomLine(),
        ],
      ),
    ));
  }

  //头部头像手机
  _headImg() {
    return Container(
      margin: EdgeInsets.only(
          left: ScreenUtil().width = 30, bottom: ScreenUtil().width = 22),
      child: Row(
        children: <Widget>[
          // 添加头像
          Container(
            child: new Align(
              alignment: Alignment.center,
              child: new CircleAvatar(
                backgroundImage: new AssetImage('images/logo.png'),
                radius: 30.0,
              ),
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: ScreenUtil().width = 10),
                  child: Text(
                    username,
                    maxLines: 11,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        color: Colors.white, fontSize: ScreenUtil().setSp(40)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  //头部底部条
  _bottomLine() {
    return Container(
      alignment: Alignment.bottomCenter,
      width: ScreenUtil().setWidth(600),
      height: ScreenUtil().setHeight(60),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(ScreenUtil().width = 10),
              topRight: Radius.circular(ScreenUtil().width = 10)),
          gradient:
              LinearGradient(colors: [Color(0xffD8B25D), Color(0xffF3D893)])),
      child: Row(
        children: <Widget>[Text('贷款VIP')],
      ),
    );
  }

  //跳转列表
  _inkList() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.all(15),
              child: GestureDetector(
                onTap: () async {
                  final loginState = await SharedPreferences.getInstance();
                  final token = loginState.getString(shared.LOGIN_STATE ?? "");
                  print(token);
                  if (token == null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyBank()));
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset('images/yhk.png'),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            '我的银行卡',
                            style: TextStyle(
                                color: Color(0xff1a1a1a),
                                fontSize: ScreenUtil().setSp(28)),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '去添加',
                          style: TextStyle(color: Color(0xffCCCCCC)),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xffCCCCCC),
                        )
                      ],
                    ),
                  ],
                ),
              )),
          Divider(
            height: 1,
          ),
          Container(
              margin: EdgeInsets.all(15),
              child: GestureDetector(
                onTap: () async {
                  final loginState = await SharedPreferences.getInstance();
                  final token = loginState.getString(shared.LOGIN_STATE ?? "");
                  print(token);
                  if (token == null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ReportPage()));
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset('images/report.png'),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            '我的评估报告',
                            style: TextStyle(
                                color: Color(0xff1a1a1a),
                                fontSize: ScreenUtil().setSp(28)),
                          ),
                        )
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xffCCCCCC),
                    )
                  ],
                ),
              )),
          Divider(
            height: 1,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AgreementPage()));
            },
            child: Container(
                margin: EdgeInsets.all(15),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AgreementPage()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset('images/xy.png'),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              '查看协议',
                              style: TextStyle(
                                  color: Color(0xff1a1a1a),
                                  fontSize: ScreenUtil().setSp(28)),
                            ),
                          )
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xffCCCCCC),
                      )
                    ],
                  ),
                )),
          ),
          Divider(
            height: 1,
          ),
          Container(
              margin: EdgeInsets.all(15),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingPage()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset('images/sz.png'),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            '账户设置',
                            style: TextStyle(
                                color: Color(0xff1a1a1a),
                                fontSize: ScreenUtil().setSp(28)),
                          ),
                        )
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xffCCCCCC),
                    )
                  ],
                ),
              )),
          Divider(
            height: 1,
          ),
        ],
      ),
    );
  }

  void showCupertinoDialog() {
    var dialog = CupertinoAlertDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            "QQ：2700196499",
            style: TextStyle(fontSize: 20,color: Color(0xffD5AB5B)),),

          Padding(padding: EdgeInsets.only(top: 6),child: Text(
            "手机：16726817100",
            style: TextStyle(fontSize: 20,color: Color(0xffD5AB5B)),), ),
          Padding(padding: EdgeInsets.only(top: 6),child:
          Text(
            "时间：周一～周五9:00：6:00",
            style: TextStyle(fontSize: 14,color: Color(0xff737373)),)),
        ],
      ),

      actions: <Widget>[
        CupertinoButton(
          child: Text("取消"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        CupertinoButton(
          child: Text("确定"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );

    showDialog(context: context, builder: (_) => dialog);
  }
}
