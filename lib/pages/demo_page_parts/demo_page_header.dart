import 'package:flutter/material.dart';

class DemoPageHeader extends StatefulWidget {

  @override
  _DemoPageHeaderState createState() => _DemoPageHeaderState();
}

class _DemoPageHeaderState extends State<DemoPageHeader> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(7.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("1,000", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.red),),
                            Row(
                              children: <Widget>[
                                Text("증30/신45", style: TextStyle(fontSize: 15.0),),
                                Container(
                                  margin: EdgeInsets.only(left: 8.0),
                                  padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.deepOrange)
                                  ),
                                  child: Icon(Icons.star, size: 18.0, color: Colors.deepOrange,),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 3.0),
                                  padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black38)
                                  ),
                                  child: Icon(Icons.notifications, size: 18.0, color: Colors.black38,),
                                ),
                              ],
                            )

                          ],
                        ),
                      )
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text('▼ 20', style: TextStyle(fontSize: 13.0),),
                                Text('-1.13%', style: TextStyle(fontSize: 13.0),),
                                SizedBox(height: 5.0,),
                                Text('382.597', style: TextStyle(fontSize: 15.0),),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              color: Color(0xffe5e5ff),
                              alignment: Alignment.center,
                              child: Text('Chart Area', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                            ),
                          )
                        ],
                      )

                    ),
                  )
                ],
              ),
            )
          ),
          Container(
            height: 40.0,
            decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 0.5, color: Colors.black12),
                  bottom: BorderSide(width: 0.5, color: Colors.black12),
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  flex:1,
                  child: Container(
                    padding: EdgeInsets.only(top:10.0, bottom: 7.0),
                    decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 3.0, color: Colors.deepOrange),
                        )
                    ),
                    child: Text(
                      "현재가",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.deepOrange),),
                  ),
                ),
                Expanded(
                  flex:1,
                  child: Container(
                    padding: EdgeInsets.only(top:10.0, bottom: 7.0),
                    child: Text("차트", textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                  ),
                ),
                Expanded(
                  flex:1,
                  child: Container(
                    padding: EdgeInsets.only(top:10.0, bottom: 7.0),
                    child: Text("체크포인트", textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                  ),
                ),
                Expanded(
                  flex:1,
                  child: Container(
                    padding: EdgeInsets.only(top:10.0, bottom: 7.0),
                    child: Text("뉴스", textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
