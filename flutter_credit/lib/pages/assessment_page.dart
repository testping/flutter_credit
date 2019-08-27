import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_credit/pages/quota_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AssessmentPage extends StatefulWidget {
  @override
  _AssessmentPageState createState() => _AssessmentPageState();
}

class _AssessmentPageState extends State<AssessmentPage> {

  Timer timer;
  var current = 0;

  @override
  void initState() {
    super.initState();
    _timerImg();
    print(current);
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(
            '评估',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.white,
          )),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
          _pgLogo(),
          _AssessmentPro()
          ],
        ),
      ),
    );
  }

  // logo
  _pgLogo(){
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      height: ScreenUtil().setHeight(450),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('images/pg_logo.png'),
          Padding(padding: EdgeInsets.only(top: ScreenUtil().width = 10),child:
          Text('额度评估中...',style: TextStyle(fontSize: ScreenUtil().setSp(35),color: Color(0xff1a1a1a)),),)
        ],
      )
    );
  }
  
  //评估进度
  // ignore: non_constant_identifier_names
  _AssessmentPro(){
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().width = 20),
            padding: EdgeInsets.only(bottom: ScreenUtil().width = 20),
            width: ScreenUtil().setWidth(650),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color:Colors.grey,
                  blurRadius: 2
                ),
              ],
            ),
            child: _itemPro(current >=2 ?'images/cir_s.png':'images/cir_n.png','个人信息评估','个人信息审核完成'),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().width = 20),
            padding: EdgeInsets.only(bottom: ScreenUtil().width = 20),
            width: ScreenUtil().setWidth(650),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color:Colors.grey,
                    blurRadius: 2
                ),
              ],
            ),
            child: _itemPro(current >=4 ?'images/cir_s.png':'images/cir_n.png','手机运营商检测','手机运营商检测完成'),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().width = 20),
            padding: EdgeInsets.only(bottom: ScreenUtil().width = 20),
            width: ScreenUtil().setWidth(650),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color:Colors.grey,
                    blurRadius: 2
                ),
              ],
            ),
            child: _itemPro(current >=6 ?'images/cir_s.png':'images/cir_n.png','额度评估','额度评估完成'),
          ),
          Padding(
            padding: EdgeInsets.only(top: ScreenUtil().width=50),
            child: Text('完成后自动跳转',style: TextStyle(fontSize: ScreenUtil().setSp(35)),),
          )
        ],
      ),
    );
  }

  void _timerImg(){

    timer  = new Timer.periodic(Duration(seconds: 1), (timer){
      print('计时中...$current');
      if(current >= 7){
        timer.cancel(); // 取消重复计时
        return;
      }
      setState(() {
        current++;
        if(current==7){
          Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(
              builder: (BuildContext context) => new QuotaPage()), (//跳转到主页
              Route route) => route == null);
        }
      });

    });
  }

  Widget _itemPro(image,title,desc){
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: ScreenUtil().width = 10,left: ScreenUtil().width = 60),
      child: Row(
        children: <Widget>[
          Image.asset(image),
          Container(
            margin: EdgeInsets.only(left: 10),
            child:
            Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 8),child: Text(title,style: TextStyle(fontSize: ScreenUtil().setSp(33),color: Color(0xff1a1a1a)),),),
                Padding(padding: EdgeInsets.only(top: 8),child: Text(desc),),
              ],
            ),
          )
        ],
      ) ,
    );
  }


  
  
  
}
