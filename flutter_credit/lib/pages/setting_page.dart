import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_credit/common/common.dart' as shared;
import 'package:shared_preferences/shared_preferences.dart';

import 'login_page.dart';
class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  var btnText = '立即登陆';
  var token = '';
  @override
  void initState() {
    super.initState();
    _btnText();
    print('initState');
  }

  _btnText() async{
    final loginState = await SharedPreferences.getInstance();
    token  = loginState.getString(shared.LOGIN_STATE??"");
    if(token==null){
      setState(() {
        btnText = '立即登陆';
      });
    }else{
      setState(() {
        btnText = '退出登录';
      });
    }
    return btnText;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            '设置',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.white,
          )),
      body:SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 15,right: 15),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: ScreenUtil().setHeight(250),
                child: Image.asset('images/logo.png'),
              ),
              Container(
                padding: EdgeInsets.only(top: 10,left: 15,right: 15,bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('意见反馈',style: TextStyle(fontSize: ScreenUtil().setSp(32)),),
                    Icon(Icons.arrow_forward_ios,color: Color(0xffcccccc),)
                  ],
                ),
              ),
              Divider(
                height: 1,
              ),
              Container(
                padding: EdgeInsets.only(top: 10,left: 15,right: 15,bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('版本信息',style: TextStyle(fontSize: ScreenUtil().setSp(32)),),
                    Text('1.0',style: TextStyle(fontSize: ScreenUtil().setSp(32)),),
                  ],
                ),
              ),
              Divider(
                height: 1,
              ),
              _exit()
            ],
          ),
        ),
      ),
    );
  }
  
  _exit(){
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: ScreenUtil().setWidth(600),
      color: Color(0xffD5AB5B),
      child:  MaterialButton(onPressed: () async {
        if(token==null){
          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      LoginPage()));
        }else{
          Navigator.pop(context);
          final loginState = await SharedPreferences.getInstance();
          loginState.remove(shared.LOGIN_STATE);
          loginState.remove(shared.PHONE_STATE);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      LoginPage()));

        }

      },
        child: Text(btnText,style: TextStyle(color: Colors.white,fontSize: ScreenUtil().setSp(30)),),),
    );
  }
}
