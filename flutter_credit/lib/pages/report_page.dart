import 'package:flutter/material.dart';
import 'package:flutter_credit/service/service_request.dart';
import 'package:flutter_credit/utils/net_loading_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_credit/common/common.dart' as shared;
import 'package:shared_preferences/shared_preferences.dart';
import 'my_page.dart';

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
//      appBar: AppBar(
//          title: Text(
//            '我的评估报告',
//            style: TextStyle(color: Colors.white),
//          ),
//          centerTitle: true,
//          iconTheme: IconThemeData(
//            color: Colors.white,
//          )),
      body: SingleChildScrollView(

        child: Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  _top(),
                  Container(
                    width: double.infinity,
                    child: SafeArea(
                      child: FractionallySizedBox(
                        widthFactor: 1.0,
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                )),
                            Expanded(
                              child:Container(
                                margin: EdgeInsets.only(right: 30),
                                child:
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '我的评估报告',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ScreenUtil().setSp(32)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  
                 SafeArea(
                     child: Container(
                       alignment: Alignment.center,
                   margin: EdgeInsets.only(top: 80),
                   child: Column(
                     children: <Widget>[
                       Align(
                         child: Text('48',style: TextStyle(fontSize: ScreenUtil().setSp(55),color: Colors.white),),
                       ),
                       Align(
                         child: Text('网络危险行为',style: TextStyle(fontSize: ScreenUtil().setSp(26),color: Colors.white),),
                       ),
                       Align(
                         child: Text('等级：良好',style: TextStyle(fontSize: ScreenUtil().setSp(26),color: Colors.white),),
                       ),
                     ],
                   ),
                 ))
                ],
              ),
              _reportInfo()
            ],
          ),
        ),
      ),
    );
  }

  _top() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Image.asset(
              'images/pg_bg.png',
              fit: BoxFit.cover,
            ),
          ),

        ],
      ),
    );
  }
  _reportInfo(){
    return Container(
      width: double.infinity,
        height: ScreenUtil().setHeight(2334),
        child: Image.asset('images/pg_content.png',fit: BoxFit.fill,),

    );
  }

  //获取分数
  _getFinas(){
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
  _disMissCallBack() async {
    final phoneState =
        await SharedPreferences.getInstance();
    final phone = phoneState
        .getString(shared.PHONE_STATE);
    if(phone==null) return null;
    print(phone);
    var formData = {'mobile':phone, };
    postRequest('userFinas', formData: formData).then((val) {
//      func();
    print(val);
    });
  }

}
