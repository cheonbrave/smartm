import 'package:flutter/material.dart';

class DemoPageBody extends StatefulWidget {
  @override
  _DemoPageBodyState createState() => _DemoPageBodyState();
}

class _DemoPageBodyState extends State<DemoPageBody> {

  // 임시방편으로 5번째 인덱스부터 리스트가 보이도록 하기위한 조치
  ScrollController _scrollController;
  double _itemSize = 50.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(initialScrollOffset: _itemSize * 5);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: 20,
        itemExtent: _itemSize,
        itemBuilder: (context, index) {
          return Row(
            children: <Widget>[
              Expanded(
                flex:1,
                child: Container(
                  child: Text("", textAlign: TextAlign.center,),
                ),
              ),
              Expanded(
                flex:1,
                child: Container(
                  child: Text("39,257", textAlign: TextAlign.center,),
                ),
              ),
              Expanded(
                flex:2,
                child: Container(
                  child: Text("총잔량", textAlign: TextAlign.center,),
                ),
              ),
              Expanded(
                flex:1,
                child: Container(
                  child: Text("97,073", textAlign: TextAlign.center,),
                ),
              ),Expanded(
                flex:1,
                child: Container(
                  child: Text("", textAlign: TextAlign.center,),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
