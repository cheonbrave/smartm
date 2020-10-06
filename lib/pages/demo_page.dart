import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smartm/pages/demo_page_parts/demo_page_body.dart';
import 'package:smartm/pages/demo_page_parts/demo_page_footer.dart';
import 'package:smartm/pages/demo_page_parts/demo_page_header.dart';

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          centerTitle: true,
          title:Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("한화투자증권", style: TextStyle(fontSize: 20.0)),
                  Icon(Icons.add, size: 15.0, color: Colors.black38,)
                ],
              ),
              Text("(003530)KOSPI", style: TextStyle(fontSize: 15.0))
            ],
          ),
          elevation: 1.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
              },
            ),
          ],
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DemoPageHeader(),
            DemoPageBody(),
            DemoPageFooter()
          ],
        )
      ),
    );
  }
}