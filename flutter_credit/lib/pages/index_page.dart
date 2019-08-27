import 'package:flutter/material.dart';
import 'package:flutter_credit/pages/home_page.dart';
import 'package:flutter_credit/pages/my_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_credit/pages/repayment_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text("首页")
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.gavel),
        title: Text("还款")
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.people),
        title: Text("我的")
    ),
  ];

  final List<Widget> tabPage = [
    HomePage(),
    RepaymentPage(),
    MyPage()
  ];

  int current = 0;
  var currentPage;

  @override
  void initState() {
    currentPage = tabPage[current];
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    //初始化屏幕适配
    ScreenUtil.instance = ScreenUtil(width: 750,height: 1334)..init(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: bottomTabs,
        type: BottomNavigationBarType.fixed,
        currentIndex: current,
        onTap: (index){
            setState(() {
              current = index;
              currentPage = tabPage[current];
            });
        },
      ),
      body: IndexedStack(
        index: current,
        children: tabPage,
      ),
    );
  }
}
