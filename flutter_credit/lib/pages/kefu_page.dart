import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class KefuPage {

  BuildContext context;


  KefuPage({Key key,this.context});

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
