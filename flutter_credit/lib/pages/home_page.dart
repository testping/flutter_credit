import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit/pages/quota_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_marquee/flutter_marquee.dart';
import 'package:flutter_seekbar/flutter_seekbar.dart'
    show ProgressValue, SectionTextModel, SeekBar;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_credit/common/common.dart' as shared;
import 'identity_page.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarBrightness: Brightness.dark));
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: ScreenUtil().setHeight(386),
            child: Image.asset("images/home_top.png", fit: BoxFit.fill),
          ),
          Positioned(
            child: Container(
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        showCupertinoDialog();
                      },
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(right: 20, top: 15),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Image.asset("images/kefu.png",
                                    width: ScreenUtil().setWidth(36),
                                    height: ScreenUtil().setHeight(40),
                                    fit: BoxFit.fill),
                              )),
                          Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text("客服",
                                      style: TextStyle(
                                          fontSize: ScreenUtil().setSp(20),
                                          color: Colors.white)))),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "万分期贷",
                        style: TextStyle(
                            color: Color(0xFFF3990F),
                            fontSize: 36,
                            fontFamily: 'PingFang',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'PingFang',
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                                text: '精品',
                                style: TextStyle(
                                  color: Color(0xFFF3990F),
                                )),
                            TextSpan(text: '始终如一，'),
                            TextSpan(
                                text: '安全',
                                style: TextStyle(
                                  color: Color(0xFFF3990F),
                                )),
                            TextSpan(text: '值得托付'),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      width: ScreenUtil().setWidth(670),
                      height: ScreenUtil().setHeight(80),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 2)
                          ],
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.all(5),
                              child: Image.asset("images/home_xinwen.png")),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.all(4),
                                  width: ScreenUtil().setWidth(460),
                                  height: ScreenUtil().setHeight(60),
                                  child: null,
//                                  FlutterMarquee(
//                                    texts: [
//                                      '用户158****2768成功借款5000元',
//                                      '用户158****2768成功借款5000元',
//                                      '用户158****2768成功借款5000元',
//                                      '用户158****2768成功借款5000元',
//                                    ].toList(),
//                                    onChange: (i) {
//                                      print(i);
//                                    },
//                                    autoStart: true,
//                                    animationDirection: AnimationDirection.t2b,
//                                    duration: 3,
//                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 203),
                      width: ScreenUtil().setWidth(670),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 2)
                          ],
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Align(
                                child: Text(
                                  "借款金额",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenUtil().setSp(35)),
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text("40000",
                                  style: TextStyle(
                                      fontSize: 40,
                                      color: Color(0xffD5AB5B),
                                      fontWeight: FontWeight.bold))),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: Column(
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                                    width: ScreenUtil().setWidth(550),
                                    child: SeekBar(
                                      progresseight: 10,
                                      value: 0.5,
                                      backgroundColor: Color(0xfffef0d5),
                                      progressColor: Color(0xffe2c183),
                                    )),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  width: ScreenUtil().setWidth(570),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "3000",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff737373)),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Text(
                                          "40000",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff737373)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  width: ScreenUtil().setWidth(570),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Align(
                                        child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text: '借款期限：',
                                                style: TextStyle(
                                                    fontSize:
                                                        ScreenUtil().setSp(26),
                                                    color: Color(0xff737373))),
                                            TextSpan(
                                                text: '1-12个月',
                                                style: TextStyle(
                                                    fontSize:
                                                        ScreenUtil().setSp(26),
                                                    color: Color(0xff1a1a1a)))
                                          ]),
                                        ),
                                      ),
                                      Align(
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                  text: '借款利息：',
                                                  style: TextStyle(
                                                      fontSize: ScreenUtil()
                                                          .setSp(26),
                                                      color:
                                                          Color(0xff737373))),
                                              TextSpan(
                                                  text: '100万',
                                                  style: TextStyle(
                                                      fontSize: ScreenUtil()
                                                          .setSp(26),
                                                      color: Color(0xff1a1a1a)))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Image.asset('images/jisu.png'),
                                        flex: 1,
                                      ),
                                      Expanded(
                                        child: Image.asset('images/qixian.png'),
                                        flex: 1,
                                      ),
                                      Expanded(
                                        child: Image.asset('images/lixi.png'),
                                        flex: 1,
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: ScreenUtil().setWidth(500),
                                  height: ScreenUtil().setHeight(70),
                                  child: MaterialButton(
                                    onPressed: () async {
                                      final loginState =
                                          await SharedPreferences.getInstance();
                                      final token = loginState
                                          .getString(shared.LOGIN_STATE ?? "");
                                      if (token == null) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage()));
                                      } else {
                                        final infoState =
                                            await SharedPreferences
                                                .getInstance();
                                        if (infoState
                                                .getString(shared.INFO_STATE) ==
                                            "1") {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      QuotaPage()));
                                        } else {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      IdentityPage()));
                                        }
                                      }
                                    },
                                    child: Text(
                                      '立即申请',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: ScreenUtil().setSp(35)),
                                    ),
                                    color: Color(0xffd5ab58),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    margin:
                                        EdgeInsets.only(top: 30, bottom: 30),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            height: ScreenUtil().setHeight(1.0),
                                            color: Color(0xffeeeeee),
                                          ),
                                          flex: 1,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 10, left: 10),
                                          child: Text(
                                            '不向学生提供贷款服务',
                                            style: TextStyle(
                                                color: Color(0xff737373)),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: ScreenUtil().setHeight(1.0),
                                            color: Color(0xffeeeeee),
                                          ),
                                          flex: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
