import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smartm/pages/demo_page_parts/demo_page_body.dart';
import 'package:smartm/pages/demo_page_parts/demo_page_footer.dart';
import 'package:smartm/pages/demo_page_parts/demo_page_header.dart';

class DemoPage2 extends StatefulWidget {

  String txt; // 탭화면 인덱스 수신
  DemoPage2({Key key, @required this.txt}) : super(key: key);

  @override
  _DemoPage2State createState() => _DemoPage2State();
}

class _DemoPage2State extends State<DemoPage2> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          centerTitle: true,
          title:Text(widget.txt, style: TextStyle(fontSize: 20.0)),
          elevation: 1.0,
        ),
      ),
      body: _makeBody(),
      backgroundColor: Colors.white,
    );
  }

  Widget _makeBody() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea( // 아이폰 노치 디자인 대응
        child: Container(
          child: Center(
            child: Text(widget.txt),
          ),
        )
      ),
    );
  }
}