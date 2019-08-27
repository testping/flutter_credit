import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toast/toast.dart';

import 'operators_page.dart';

class EmergentPage extends StatefulWidget {
  @override
  _EmergentPageState createState() => _EmergentPageState();
}

class _EmergentPageState extends State<EmergentPage> {
  TextEditingController zjName = TextEditingController(); //直接联系人
  TextEditingController zjPhone = TextEditingController(); //直接联系人手机
  TextEditingController jsName = TextEditingController(); //紧急联系人
  TextEditingController jsPhone = TextEditingController(); //紧急联系人手机
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    print('aaa${ScreenUtil.screenHeight * 0.07}');
    return Container(
        width: double.infinity,
        height: ScreenUtil().setHeight(1334),
        child: Scaffold(
          appBar: AppBar(
                  title: Text(
                    '紧急联系人',
                    style: TextStyle(color: Colors.white),
                  ),
                  centerTitle: true,
                  iconTheme: IconThemeData(
                    color: Colors.white,
                  )),
          body: Container(
            child: SingleChildScrollView(
             child: Container(
               width: double.infinity,
               height: ScreenUtil().setHeight(1150),
               child: FractionallySizedBox(
               alignment: Alignment.center,
               heightFactor: 1.0,
               widthFactor: 1.0,
               child: Column(
                 mainAxisSize: MainAxisSize.max,
                 children: <Widget>[
                   _infoPro(),
                   _egPerson(),
                   Expanded(
                     child: Container(
                       alignment: Alignment.bottomCenter,
                       width: ScreenUtil().setWidth(750),
                       child: MaterialButton(
                         onPressed: () {
                           if(zjName.text.isEmpty)return  Toast.show("请填写完整", context,
                               duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                           if(zjPhone.text.isEmpty)return  Toast.show("请填写完整", context,
                               duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                           if(jsName.text.isEmpty)return  Toast.show("请填写完整", context,
                               duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                           if(jsPhone.text.isEmpty)return  Toast.show("请填写完整", context,
                               duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                           Navigator.push(
                               context,
                               MaterialPageRoute(
                                   builder: (context) => OperatorsPage()));
                         },
                         height: ScreenUtil().setHeight(100),
                         minWidth: double.infinity,
                         color: Color(0xffD5AB5B),
                         child: Text(
                           '提交',
                           style: TextStyle(
                               color: Colors.white,
                               fontSize: ScreenUtil().setSp(35)),
                         ),
                       ),
                     ),
                   )
                 ],
               ),
             ),
             ),
            ),
          )
      ),
    );
  }

  //信息进度条
  _infoPro() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Image.asset('images/two.png'),
    );
  }

  //紧急联系人填写
  _egPerson() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            color: Color(0xfffafafa),
            padding: EdgeInsets.all(10),
            child: Text(
              '直接联系人',
              style: TextStyle(
                color: Color(0xff737373),
              ),
            ),
          ),
          Divider(
            height: 1,
          ),
          Container(
            width: ScreenUtil().setWidth(650),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                  child: Text(
                    '与本人关系',
                    style: TextStyle(
                        color: Color(0xff1a1a1a),
                        fontSize: ScreenUtil().setSp(33)),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: (){
                      _modalBottomSheetMenu('父母', '配偶', '兄弟', '姐妹', '其他', 2);
                    },
                    child: TextField(
                      enabled: false,
                      controller: zjName,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          hintText: '请选择', border: InputBorder.none),
                    ),
                  )
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
          ),
          Container(
            width: ScreenUtil().setWidth(650),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                  child: Text(
                    '紧急联系人',
                    style: TextStyle(
                        color: Color(0xff1a1a1a),
                        fontSize: ScreenUtil().setSp(33)),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: zjPhone,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                        hintText: '手机号', border: InputBorder.none),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: Color(0xfffafafa),
            padding: EdgeInsets.all(10),
            child: Text(
              '其他联系人',
              style: TextStyle(
                color: Color(0xff737373),
              ),
            ),
          ),
          Divider(
            height: 1,
          ),
          Container(
            width: ScreenUtil().setWidth(650),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                  child: Text(
                    '与本人关系',
                    style: TextStyle(
                        color: Color(0xff1a1a1a),
                        fontSize: ScreenUtil().setSp(33)),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: (){
                      _modalBottomSheetMenu('父母', '配偶', '兄弟', '姐妹', '其他', 1);
                    },
                    child: TextField(
                      enabled: false,
                      controller: jsName,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          hintText: '请选择', border: InputBorder.none),
                    ),
                  )
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
          ),
          Container(
            width: ScreenUtil().setWidth(650),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                  child: Text(
                    '紧急联系人',
                    style: TextStyle(
                        color: Color(0xff1a1a1a),
                        fontSize: ScreenUtil().setSp(33)),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: jsPhone,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                        hintText: '手机号', border: InputBorder.none),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  void _modalBottomSheetMenu(String one,String two,String three,String four,String five,int tag){
    if(tag==1){
      showModalBottomSheet(
          context: context,
          builder: (builder){
            return new Container(
              height: ScreenUtil().setHeight(600),
              color: Colors.transparent, //could change this to Color(0xFF737373),
              //so you don't have to change MaterialApp canvasColor
              child: new Container(
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(10.0),
                          topRight: const Radius.circular(10.0))),
                  child: new Center(
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          onTap: (){
                            setState(() {
                              jsName.text  = one;
                            });
                            Navigator.pop(context);
                          },
                          child:  Padding(padding: EdgeInsets.all(20.0),
                            child: Text(one),) ,
                        ),
                        Divider(
                          height: 1,
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              jsName.text  = two;
                            });
                            Navigator.pop(context);
                          },
                          child:  Padding(padding: EdgeInsets.all(20.0),
                            child: Text(two),) ,
                        ),
                        Divider(
                          height: 1,
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              jsName.text  = three;
                            });
                            Navigator.pop(context);
                          },
                          child:  Padding(padding: EdgeInsets.all(20.0),
                            child: Text(three),) ,
                        ),
                        Divider(
                          height: 1,
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              jsName.text  = four;
                            });
                            Navigator.pop(context);
                          },
                          child:  Padding(padding: EdgeInsets.all(20.0),
                            child: Text(four),) ,
                        ),
                        Divider(
                          height: 1,
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              jsName.text = five;
                            });
                            Navigator.pop(context);
                          },
                          child:  Padding(padding: EdgeInsets.all(20.0),
                            child: Text(five),) ,
                        ),
                        Divider(
                          height: 1,
                        ),
                      ],
                    ),
                  )),
            );
          }
      );
    }else{
      showModalBottomSheet(
          context: context,
          builder: (builder){
            return new Container(
              height: ScreenUtil().setHeight(600),
              color: Colors.transparent, //could change this to Color(0xFF737373),
              //so you don't have to change MaterialApp canvasColor
              child: new Container(
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(10.0),
                          topRight: const Radius.circular(10.0))),
                  child: new Center(
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          onTap: (){
                            setState(() {
                              zjName.text  = one;
                            });
                            Navigator.pop(context);
                          },
                          child:  Padding(padding: EdgeInsets.all(20.0),
                            child: Text(one),) ,
                        ),
                        Divider(
                          height: 1,
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              zjName.text  = two;
                            });
                            Navigator.pop(context);
                          },
                          child:  Padding(padding: EdgeInsets.all(20.0),
                            child: Text(two),) ,
                        ),
                        Divider(
                          height: 1,
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              zjName.text  = three;
                            });
                            Navigator.pop(context);
                          },
                          child:  Padding(padding: EdgeInsets.all(20.0),
                            child: Text(three),) ,
                        ),
                        Divider(
                          height: 1,
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              zjName.text  = four;
                            });
                            Navigator.pop(context);
                          },
                          child:  Padding(padding: EdgeInsets.all(20.0),
                            child: Text(four),) ,
                        ),
                        Divider(
                          height: 1,
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              zjName.text = five;
                            });
                            Navigator.pop(context);
                          },
                          child:  Padding(padding: EdgeInsets.all(20.0),
                            child: Text(five),) ,
                        ),
                        Divider(
                          height: 1,
                        ),
                      ],
                    ),
                  )),
            );
          }
      );
    }

  }
}
