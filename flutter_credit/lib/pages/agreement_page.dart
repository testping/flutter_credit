import 'package:flutter/material.dart';
import 'package:flutter_credit/json/agreement.dart';
import 'package:flutter_credit/pages/text_xml.dart';
import 'package:flutter_credit/pages/webview_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AgreementPage extends StatefulWidget {
  @override
  _AgreementPageState createState() => _AgreementPageState();
}

class _AgreementPageState extends State<AgreementPage> {



  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            '查看协议',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.white,
          )),
      body:FractionallySizedBox(
        alignment: Alignment.center,
        widthFactor: 1.0,
        heightFactor: 1.0,
        child:  SingleChildScrollView(
          child:Column(
            children: <Widget>[
              _cardList("《注册服务协议》",Icons.arrow_forward_ios,1),
              _cardList("《委托扣款授权书》",Icons.arrow_forward_ios,2),
              _cardList("《信用评估服务协议》",Icons.arrow_forward_ios,3),
              _cardList("《信用授权及使用协议》",Icons.arrow_forward_ios,4),
              _cardList("《贷款服务协议》",Icons.arrow_forward_ios,5),
            ],
          )
        ),
      )
    );
  }

   _cardList( String title,IconData icon,int tag){
    return GestureDetector(
      onTap: (){
        print('点击了$tag');
        switch(tag){
          case 1:
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TextXml(tag: 1,),
                ));
            break;
          case 2:
            break;
          case 3:
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TextXml(tag: 3,),
                ));
            break;
          case 4:
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TextXml(tag: 4,),
                ));
            break;
          case 5:
            break;
        }
      },
      child:
          Container(
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.only(bottom: 30,top: 30,left: 10,right: 10),
            width: ScreenUtil().setWidth(650),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(color: Colors.grey, blurRadius: 2)
                ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(title,style: TextStyle(color: Color(0xffD5AB5B),fontSize: ScreenUtil().setSp(33)),),
                Icon(icon,color: Color(0xffD5AB5B),),
              ],
            ),
          ),
    );
  }

}
