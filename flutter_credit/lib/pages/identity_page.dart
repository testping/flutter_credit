import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toast/toast.dart';
import 'emergent_page.dart';

// 系统AppBar高度
//double appBarHeight = ScreenUtil.getInstance().appBarHeight;

class IdentityPage extends StatefulWidget {
  @override
  _IdentityPageState createState() => _IdentityPageState();
}

class _IdentityPageState extends State<IdentityPage> {
  var _imgPath;
  TextEditingController userName = TextEditingController(); //姓名
  TextEditingController idCard = TextEditingController(); //身份证
  TextEditingController jAddress = TextEditingController(); //居住地址
  TextEditingController xAddress = TextEditingController(); //详细地址
  TextEditingController work = TextEditingController(); //工作
  TextEditingController education = TextEditingController(); //教育

  var workType = '请选择';
  var educationType = '请选择';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    print("状态栏高度${MediaQueryData.fromWindow(window).padding.top}");
//    print("状态栏高度${ScreenUtil.getInstance().appBarHeight}");
    double height = (MediaQueryData.fromWindow(window).padding.top +
            MediaQuery.of(context).padding.bottom) *
        2;
    return Scaffold(
        appBar: AppBar(
            title: Text(
              '身份认证',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            iconTheme: IconThemeData(
              color: Colors.white,
            )),
        body: FractionallySizedBox(
          widthFactor: 1.0,
          heightFactor: 1.0,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              alignment: Alignment.center,
              color: Colors.white,
              width: double.infinity,
              height: ScreenUtil().setHeight(1204 - height),
              child: Column(
                children: <Widget>[
                  _infoPro(),
//                  _idCardImg(),
                  _identity(),
                ],
              ),
            ),
          ),
        ));
  }

  //信息进度条
  _infoPro() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Image.asset('images/one.png'),
    );
  }

  //身份证照片上传
  _idCardImg() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _ImageView(_imgPath),
//          _ImageViewGh(_imgPath),
        ],
      ),
    );
  }

  /*图片控件人像*/
  Widget _ImageView(imgPath) {
    if (imgPath == null) {
      return InkWell(
        onTap: () {
          showDialog<Null>(
            context: context,
            builder: (BuildContext context) {
              return new SimpleDialog(
                backgroundColor: Color(0xffD5AB5B),
                title: Align(
                  child: Text(
                    "请选择",
                    style: TextStyle(color: Colors.white),
                  ),
                  alignment: Alignment.center,
                ),
                children: <Widget>[
                  new SimpleDialogOption(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        child: InkWell(
                          onTap: () {
                            print("点击相机");
                            _takePhoto(); //打开相机
                            Navigator.of(context).pop();
                          },
                          child: Align(
                            child: Text("拍照",
                                style: TextStyle(color: Colors.white)),
                            alignment: Alignment.center,
                          ),
                        ),
                      )),
                  new SimpleDialogOption(
                    child: Align(
                      child: InkWell(
                        child:
                            Text("相册", style: TextStyle(color: Colors.white)),
                        onTap: () {
                          _openGallery(); //打开相册
                          Navigator.of(context).pop();
                        },
                      ),
                      alignment: Alignment.center,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          ).then((val) {
            print(val);
          });
        },
        child: Center(
          child: Image.asset('images/renxiang.png'),
        ),
      );
    } else {
      return Image.file(
        imgPath,
        fit: BoxFit.cover,
        width: ScreenUtil().setWidth(270),
        height: ScreenUtil().setHeight(200),
      );
    }
  }

  /*图片控件国徽*/
  Widget _ImageViewGh(imgPath) {
    if (imgPath == null) {
      return Center(
        child: Image.asset('images/guohui.png'),
      );
    } else {
      return Image.file(
        imgPath,
      );
    }
  }

  //  拍照
  _takePhoto() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _imgPath = image;
    });
  }

  // 打开相册
  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imgPath = image;
    });
  }

  //身份资料
  Widget _identity() {
    return Expanded(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, right: 10,top: 50),
            child: Column(
              children: <Widget>[
                Divider(
                  height: 1,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Align(
                        child: Text(
                          '姓名',
                          style: TextStyle(
                              color: Color(0xff1a1a1a),
                              fontSize: ScreenUtil().setSp(30)),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextField(
                          textAlign: TextAlign.right,
                          controller: userName,
                          decoration: InputDecoration(
                              hintText: '姓名',
                              hintStyle:
                                  TextStyle(fontSize: ScreenUtil().setSp(24)),
                              border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Align(
                        child: Text(
                          '身份证号',
                          style: TextStyle(
                              color: Color(0xff1a1a1a),
                              fontSize: ScreenUtil().setSp(30)),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextField(
                          controller: idCard,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                              hintText: '身份证号',
                              hintStyle:
                                  TextStyle(fontSize: ScreenUtil().setSp(24)),
                              border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Align(
                        child: Text(
                          '工作类型',
                          style: TextStyle(
                              color: Color(0xff1a1a1a),
                              fontSize: ScreenUtil().setSp(30)),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: (){_modalBottomSheetMenu('上班人群','个体企业','企业主','学生','无固定职业',1);},
                          child: TextField(
                            controller: work,
                            textAlign: TextAlign.right,
                            enabled: false,
                            decoration: InputDecoration(
                                hintText: workType,
                                hintStyle:
                                TextStyle(fontSize: ScreenUtil().setSp(24)),
                                border: InputBorder.none),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Align(
                        child: Text(
                          '教育程度',
                          style: TextStyle(
                              color: Color(0xff1a1a1a),
                              fontSize: ScreenUtil().setSp(30)),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: (){_modalBottomSheetMenu('硕士及以上','本科','大专','中专','高中及以下',2);},
                          child: TextField(
                            controller: education,
                            textAlign: TextAlign.right,
                            enabled: false,
                            decoration: InputDecoration(
                                hintText: educationType,
                                hintStyle:
                                TextStyle(fontSize: ScreenUtil().setSp(24)),
                                border: InputBorder.none),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Align(
                        child: Text(
                          '居住地址',
                          style: TextStyle(
                              color: Color(0xff1a1a1a),
                              fontSize: ScreenUtil().setSp(30)),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextField(
                          controller: jAddress,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                              hintText: '居住地址',
                              hintStyle:
                                  TextStyle(fontSize: ScreenUtil().setSp(24)),
                              border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Align(
                        child: Text(
                          '详细地址',
                          style: TextStyle(
                              color: Color(0xff1a1a1a),
                              fontSize: ScreenUtil().setSp(30)),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextField(
                          controller: xAddress,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                              hintText: '街道、门牌号',
                              hintStyle:
                                  TextStyle(fontSize: ScreenUtil().setSp(24)),
                              border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                onPressed: () {
                  print(userName.text);
                  if(userName.text.isEmpty) return  Toast.show("姓名不能为空", context,
                      duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                  if(idCard.text.isEmpty) return  Toast.show("身份证不能为空", context,
                      duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                  if(work.text.isEmpty) return  Toast.show("工作类型不能为空", context,
                      duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                  if(education.text.isEmpty) return  Toast.show("教育程度不能为空", context,
                      duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                  if(jAddress.text.isEmpty) return  Toast.show("居住地址不能为空", context,
                      duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                  if(xAddress.text.isEmpty) return  Toast.show("详细不能为空", context,
                      duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EmergentPage()));
                },
                height: ScreenUtil().setHeight(100),
                minWidth: double.infinity,
                color: Color(0xffD5AB5B),
                child: Text(
                  '提交',
                  style: TextStyle(
                      color: Colors.white, fontSize: ScreenUtil().setSp(35)),
                ),
              ),
            ),
          )
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
                              work.text  = one;
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
                              work.text  = two;
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
                              work.text  = three;
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
                              work.text  = four;
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
                              work.text = five;
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
                              education.text = one;
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
                              education.text = two;
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
                              education.text = three;
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
                              education.text = four;
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
                              education.text = five;
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
