import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_credit/json/menu.dart';
import 'package:flutter_credit/json/pro_list.dart';
import 'package:flutter_credit/pages/webview_page.dart';
import 'package:flutter_credit/service/service_request.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_credit/common/common.dart' as shared;
import 'package:shared_preferences/shared_preferences.dart';

class RecommendPage extends StatefulWidget {
  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  String jpImg;
  String jpName;
  String jpId;
  String jpUrl;
  List<DataPro> youxList = [];
  String menuId;
  List<DataPro> jpList = [];
  String RmmenuId;
  final AsyncMemoizer _memoizer = AsyncMemoizer();

  List<String> _list = [];
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      var position = _scrollController.position;
      // 小于50px时，触发上拉加载；
      if (position.maxScrollExtent - position.pixels < 50) {
        _loadMore();
      }
    });

    _getMenu();
  }

  @override
  void dispose() {
    print("RefreshListPage _dispose()");
    _scrollController?.dispose();
    super.dispose();
  }

  //获取优选
  _gerData() {
    var formData = {'pid': menuId == null ? "19" : menuId, 'page': "1"};
    return _memoizer.runOnce(
      () async {
        return await getRequest('recommendIndex', formData: formData);
      },
    );
  }

  //获取热门
  _gerHot() async {
    var formDataJP = {'pid': RmmenuId == null ? "41" : menuId, 'page': "1"};
    await getRequest('recommendIndex', formData: formDataJP).then((val) {
      ProList proList = ProList.fromJson(val);
      jpList = proList.data.toList();
    });
  }

  //点击贷款列表
  _gerTion(String pid ,String url,String title) async {

    final uidShard=
    await SharedPreferences.getInstance();
    final uid = uidShard
        .getString(shared.PHONE_UID);
    final phone = uidShard
        .getString(shared.PHONE_STATE);
    var formData;
    if (Platform.isIOS) {
      formData = {
        'uid': uid,
        'pid': pid,
        'mobile': phone,
        'canel': '：iosqyb'
      };
    } else if (Platform.isAndroid) {
      formData = {
        'uid': uid,
        'pid': pid,
        'mobile': phone,
        'canel': '：iosqyb'
      };
    }
    await postRequest('apptionClick', formData: formData).then((val) {
      print(val);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>
          WebView(url: url,title: title,)));
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return Scaffold(
        appBar: AppBar(
            title: Text(
              '智能推荐',
              style: TextStyle(color: Colors.white),
            ),
            elevation: 0.0,
            centerTitle: true,
            iconTheme: IconThemeData(
              color: Colors.white,
            )),
        body: FutureBuilder(
          future: _gerData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                print('waiting');
                _gerHot();
                return new Center(
                  child: Text('加载中'),
                );
                break;
              case ConnectionState.active:
                print('active');
                _gerHot();
                return new Text('Press button to 222');
                break;
              case ConnectionState.done:
                print('done');
                break;
            }
            if (snapshot.hasData) {
              ProList proList = ProList.fromJson(snapshot.data);
              List<DataPro> data = proList.data.toList();
              youxList = data;
            }
            return FractionallySizedBox(
              alignment: Alignment.center,
              widthFactor: 1.0,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    _topJP(),
                    _tjImg(),
                    _yxTj(),
                    _jpTj()
                  ],
                ),
              ),
            );
          },
        ));
  }

  _topJP() {
    return Container(
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(100),
            decoration: BoxDecoration(
              color: Color(0xffD5AB5B),
            ),
          ),
         GestureDetector(
           onTap: (){
             _gerTion(jpId,jpUrl,jpName);
           },
           child:  Container(
             width: ScreenUtil().setWidth(700),
             decoration: BoxDecoration(
                 color: Colors.white,
                 boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
                 borderRadius: BorderRadius.all(Radius.circular(10))),
             child: Stack(
               children: <Widget>[
                 Container(
                   margin: EdgeInsets.only(top: ScreenUtil().width = 10),
                   child: Align(
                     alignment: Alignment.topCenter,
                     child: Image.network(
                       jpImg == null
                           ? "http://gss0.baidu.com/9fo3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/caef76094b36acaf14af9fd87cd98d1001e99c42.jpg"
                           : jpImg,
                       width: ScreenUtil().setWidth(650),
                       height: ScreenUtil().setHeight(140),
                       fit: BoxFit.fill,
                     ),
                   ),
                 ),
                 Container(
                   child: Image.asset('images/jp.png'),
                 ),
                 Container(
                   alignment: Alignment.center,
                   margin: EdgeInsets.only(
                       top: ScreenUtil().setHeight(180),
                       bottom: ScreenUtil().setHeight(15)),
                   child: Column(
                     children: <Widget>[
                       Container(
                         width: ScreenUtil().setWidth(650),
                         height: ScreenUtil().setHeight(60),
                         decoration: BoxDecoration(color: Color(0xffD5AB5B)),
                         child: Container(
                           alignment: Alignment.center,
                           child: Text(
                             '一键领钱',
                             style: TextStyle(color: Colors.white),
                           ),
                         ),
                       ),
                       Container(
                         margin:
                         EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                         child: Text('建议同时申请3-5款产品,通过率99%'),
                       ),
                     ],
                   ),
                 )
               ],
             ),
           ),
         )
        ],
      ),
    );
  }

  // 引导图片
  _tjImg() {
    return Container(
        margin: EdgeInsets.only(top: ScreenUtil().width = 10),
        child: Image.asset('images/bannerjp.png'));
  }

  //优选推荐
  _yxTj() {
    return Container(
      width: ScreenUtil().setWidth(700),
      margin: EdgeInsets.only(top: ScreenUtil().width = 10),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: ScreenUtil().setHeight(30),
                width: ScreenUtil().setWidth(7),
                color: Color(0xffD5AB5B),
              ),
              Container(
                margin: EdgeInsets.only(left: ScreenUtil().width = 10),
                child: Text(
                  '优选推荐',
                  style: TextStyle(
                      color: Color(0xff1a1a1a),
                      fontSize: ScreenUtil().setSp(30)),
                ),
              ),
            ],
          ),
          Container(
            child: warpYx(youxList),
          ),
        ],
      ),
    );
  }

  //推荐接口菜单
  _getMenu() async {
    await getRequest('recommendMenu').then((val) {
      Menu menu = Menu.fromJson(val);
      List menuList = menu.data.toList();
      var formData = {'pid': menuList[0].id, 'page': "1"};
      getRequest('recommendIndex', formData: formData).then((val) {
        ProList proList = ProList.fromJson(val);
        setState(() {
          jpImg = proList.data[0].upload;
          jpId = proList.data[0].id;
          jpUrl = proList.data[0].url;
          jpName =  proList.data[0].loaname;
          menuId = menuList[1].id;
          RmmenuId = menuList[2].id;
        });
      });
    });
  }

  //优选推荐
  Widget warpYx(List<DataPro> yxList) {
    if (yxList.length != 0 && yxList.length != null && yxList != null) {
      List<Widget> listWidget = yxList.map((val) {
        return InkWell(
          onTap: () {
            _gerTion(val.id,val.url,val.loaname);

          },
          child: Container(
            width: ScreenUtil().setWidth(340),
            padding: EdgeInsets.all(ScreenUtil().width = 10),
            margin: EdgeInsets.only(top: ScreenUtil().width = 10),
            child: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: new NetworkImage(val.upload),
                        radius: 10.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(val.loaname),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          val.amount,
                          style: TextStyle(
                              color: Color(0xffD5AB5B),
                              fontSize: ScreenUtil().setSp(32)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          '元',
                          style: TextStyle(fontSize: ScreenUtil().setSp(22)),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      val.desci,
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(22),
                          color: Color(0xff737373)),
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(color: Color(0xffF5F5F5)),
          ),
        );
      }).toList();
      return Wrap(
        spacing: 2,
        children: listWidget,
      );
    } else {
      return Container(
        child: Text(''),
      );
    }
  }

  //精品推荐
  _jpTj() {
    return Container(
      width: ScreenUtil().setWidth(700),
      margin: EdgeInsets.only(top: ScreenUtil().width = 10),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: ScreenUtil().setHeight(30),
                width: ScreenUtil().setWidth(7),
                color: Color(0xffD5AB5B),
              ),
              Container(
                margin: EdgeInsets.only(left: ScreenUtil().width = 10),
                child: Text(
                  '热门推荐',
                  style: TextStyle(
                      color: Color(0xff1a1a1a),
                      fontSize: ScreenUtil().setSp(30)),
                ),
              ),
            ],
          ),
          Container(
            child: jpTjInfo(jpList),
          ),
        ],
      ),
    );
  }

  //精品推荐数据
  jpTjInfo(List<DataPro> jpList) {
    if (jpList.length != 0 && jpList.length != null && jpList != null) {
      List<Widget> list = jpList.map((val) {
        return InkWell(
            onTap: () { _gerTion(val.id,val.url,val.loaname); },
            child: Container(
              margin: EdgeInsets.all(ScreenUtil().setWidth(5)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
              ),
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: ScreenUtil().width = 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.network(
                          val.upload,
                          width: ScreenUtil().setWidth(100),
                          height: ScreenUtil().setHeight(100),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          val.loaname,
                          style: TextStyle(
                              color: Color(0xff1a1a1a),
                              fontSize: ScreenUtil().setSp(30)),
                        ),
                        Container(
                          padding: EdgeInsets.all(ScreenUtil().width = 5),
                          alignment: Alignment.center,
                          color: Color(0xffFFF5E9),
                          child: Text(
                            '极速放款',
                            style: TextStyle(
                                color: Color(0xffFF9A26),
                                fontSize: ScreenUtil().setSp(20)),
                          ),
                        ),
                        Container(
                          child: Text(
                            '额度范围(元)',
                            style: TextStyle(
                                color: Color(0xff737373),
                                fontSize: ScreenUtil().setSp(23)),
                          ),
                        ),
                        Container(
                          child: Text(
                            val.amount,
                            style: TextStyle(
                                color: Color(0xff1a1a1a),
                                fontSize: ScreenUtil().setSp(32)),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          '',
                          style: TextStyle(
                              color: Color(0xff1a1a1a),
                              fontSize: ScreenUtil().setSp(30)),
                        ),
                        Container(
                          padding: EdgeInsets.all(ScreenUtil().width = 5),
                          alignment: Alignment.center,
                          color: Color(0xffEDF5FE),
                          child: Text(
                            '贷款期限' + val.loanlimit,
                            style: TextStyle(
                                color: Color(0xff3377FF),
                                fontSize: ScreenUtil().setSp(20)),
                          ),
                        ),
                        Container(
                          child: Text(
                            '月利率',
                            style: TextStyle(
                                color: Color(0xff737373),
                                fontSize: ScreenUtil().setSp(23)),
                          ),
                        ),
                        Container(
                          child: Text(
                            val.loanrate,
                            style: TextStyle(
                                color: Color(0xffF94042),
                                fontSize: ScreenUtil().setSp(32)),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          gradient: LinearGradient(colors: [
                            Color(0xffF6DFB2),
                            Color(0xffD5AB5B),
                          ])),
                      padding: EdgeInsets.all(ScreenUtil().width = 8),
                      child: Text(
                        '去申请',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(33)),
                      ),
                    ),
                  ],
                ),
              ),
            ));
      }).toList();
      return Container(
          height: ScreenUtil().setHeight(1800),
          child: GridView.count(
            //垂直子Widget之间间距
            mainAxisSpacing: 30.0,
            childAspectRatio: 3.0,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 1,
            children: list,
          ));
    } else {
      return Container(
        child: Text(''),
      );
    }
  }

  Future<void> _onRefresh() async {
    print("RefreshListPage _onRefresh()");
    await Future.delayed(Duration(seconds: 2), () {
      _list = List.generate(15, (i) => "我是刷新出的数据${i}");
      setState(() {});
    });
  }

  bool isLoading = false;

  void _loadMore() async {
    print("RefreshListPage _loadMore()");
    if (!isLoading) {
      isLoading = true;
      setState(() {});
      Future.delayed(Duration(seconds: 3), () {
        print("RefreshListPage isLoading = ${isLoading}");
        isLoading = false;
        _list = List.from(_list);
        _list.addAll(List.generate(5, (index) => "上拉加载个数${index}"));
        setState(() {});
      });
    }
  }
}
