import 'package:flutter/material.dart';

class DemoPageFooter extends StatefulWidget {
  @override
  _DemoPageFooterState createState() => _DemoPageFooterState();
}

class _DemoPageFooterState extends State<DemoPageFooter> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      child: Column(
        children: <Widget>[
          Container(
            height: 30.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            ),
          ),
          Expanded(
              child: Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('코스피종합'),
                    Text('2,330.94', style: TextStyle(color: Colors.red),),
                    Text('▲ 1.35', style: TextStyle(color: Colors.red),),
                    Text('▲ 0.06%', style: TextStyle(color: Colors.red),),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                    Icon(Icons.settings, size: 15.0,),
                    Text('설정'),
                  ],
                ),
              )
          ),

        ],
      ),
    );
  }
}
