import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit/json/agreement.dart';
import 'package:flutter_credit/service/service_request.dart';

class TextXml extends StatefulWidget {
  final int tag;

  TextXml({Key key, this.tag}) : super(key: key);

  @override
  _TextXmlState createState() => _TextXmlState();
}

class _TextXmlState extends State<TextXml> {
  String title = '';
  String content = '';

  @override
  void initState() {
    super.initState();
    _getThreeAgreement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.white,
          )),
      body: SingleChildScrollView(
        child: Container(
          child: Html(data: content),
        ),
      ),
    );
  }

  _getThreeAgreement() {
    getRequest('threeAgreement').then((val) {
      print(val);
      Agreement agreement = Agreement.fromJson(val);
      if (agreement.status == 200) {
        List<Data> dataList = agreement.data.toList();
        switch (widget.tag) {
          case 1:
            setState(() {
              title = dataList[0].title;
              content = dataList[0].content;
            });
            break;
          case 4:
            setState(() {
              title = dataList[1].title;
              content = dataList[1].content;
            });
            break;
          case 3:
            setState(() {
              title = dataList[3].title;
              content = dataList[3].content;
            });
            break;
          default:
            break;
        }
      }
    });
  }
}
