import 'package:flutter/material.dart';
import 'package:flutter_credit/pages/agreement_page.dart';
import 'package:flutter_credit/pages/assessment_page.dart';
import 'package:flutter_credit/pages/emergent_page.dart';
import 'package:flutter_credit/pages/identity_page.dart';
import 'package:flutter_credit/pages/index_page.dart';
import 'package:flutter_credit/pages/kefu_page.dart';
import 'package:flutter_credit/pages/login_page.dart';
import 'package:flutter_credit/pages/my_bank.dart';
import 'package:flutter_credit/pages/operators_page.dart';
import 'package:flutter_credit/pages/quota_page.dart';
import 'package:flutter_credit/pages/recommend_page.dart';
import 'package:flutter_credit/pages/report_page.dart';
import 'package:flutter_credit/pages/webview_page.dart';
import 'package:flutter_credit/pages/welcome_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      child: MaterialApp(
        color: Colors.white,
        title: "万分期待",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Color(0xffD5AB5B)
        ),
        home: RecommendPage(),
      ),
    );
  }
}
