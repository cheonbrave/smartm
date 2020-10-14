import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smartm/pages/datas/price_info.dart';

class DemoPageBody extends StatefulWidget {
  @override
  _DemoPageBodyState createState() => _DemoPageBodyState();
}

class _DemoPageBodyState extends State<DemoPageBody> {

  // 임시방편으로 5번째 인덱스부터 리스트가 보이도록 하기위한 조치
  ScrollController _scrollController = ScrollController();

  ScrollController _scrollControllerTop = ScrollController();
  ScrollController _scrollControllerDown = ScrollController();
  ScrollController _scrollControllerLeftDown = ScrollController();

  double _itemSize = 50.0;
  double screen_h = 0.0;
  double body_h = 0.0;

  double currentPrice = 0; // 현재가

  PriceInfo pi = PriceInfo();
  List<PriceRow> list_up_pr = List();
  List<PriceRow> list_down_pr = List();
  PriceRow pr = null;

  // 테스트데이터 생성을 위한 난수발생
  Random _random = Random();

  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  Function mathFunc = (Match match) => '${match[1]},';
  
  double boxPadding = 12.0;
  double priceMargin = 5.0;

  @override
  void initState() {
    super.initState();

    /* 기본 주가정보 셋팅 (호가, 시고저종가, 52주 저가/고가, vi, 전일종가, 전일거래량*/
    pi.term = 5;
    pi.start = 1000;
    pi.top = 1300;
    pi.bottom = 700;
    pi.end = 0;
    pi.bottom52 = 900;
    pi.top52 = 1100;
    pi.vi = 1000;
    pi.vi_down = 850;
    pi.vi_up = 1150;
    pi.pre_end = 1000;
    pi.pre_trade_amount = 300000;
    pi.top_limit = pi.start * 1.3;
    pi.bottom_limit = pi.start * 0.7;

    currentPrice = 1000;

    setList();
    demoDataLoop();

    // onload개념, 화면 다 그려진다음 행할 액션 적용
    WidgetsBinding.instance.addPostFrameCallback((_) => onload());
  }

  void onload() {
    //_scrollController.jumpTo(_itemSize * 5.0);
    _scrollController.animateTo(_itemSize * 5.0, duration: Duration(milliseconds: 300), curve: Curves.ease);

  }

  void setList(){

    bool isFirst = true;

    if(list_up_pr.isEmpty){
      isFirst = true;
    }else{
      isFirst = false;
    }

    setState(() {
      int idx = -1;
      for(int i=10; i >= 1; i--){
        idx++;
        pr = PriceRow();
        pr.waitAmount = _random.nextDouble() * 10000;
        pr.waitAmount = pr.waitAmount.floorToDouble();
        pr.price = currentPrice + (i * pi.term);
        pr.ratio = ((currentPrice / pr.price) * 100.0) - 100.0;
        if(pr.ratio < 0){
          pr.ratio *= -1;
        }
        pr.ratio = double.parse(pr.ratio.toStringAsFixed(2));

        if(isFirst){
          list_up_pr.add(pr);
        }else{
          list_up_pr[idx] = pr;
        }
      }

      idx = -1;
      for(int i=0; i >= -9; i--){
        idx++;
        pr = PriceRow();
        pr.waitAmount = _random.nextDouble() * 10000;
        pr.waitAmount = pr.waitAmount.floorToDouble();
        pr.price = currentPrice + (i * pi.term);
        pr.ratio = ((currentPrice / pr.price) * 100.0) - 100.0;
        if(pr.ratio < 0){
          pr.ratio *= -1;
        }
        pr.ratio = double.parse(pr.ratio.toStringAsFixed(2));

        if(isFirst){
          list_down_pr.add(pr);
        }else{
          list_down_pr[idx] = pr;
        }
      }
    });
  }

  void demoDataLoop(){
    Timer(Duration(seconds: 1), () {
      setList();
      demoDataLoop();
    });
  }

  @override
  Widget build(BuildContext context) {

    screen_h = MediaQuery.of(context).size.height;
    // body 높이는 스크린높이에서 앱바(60), 헤더(120), 풋터(60), 탭바(92)를 뺀 값
    body_h = screen_h - 60.0 - 120.0 - 60.0 - 92.0 - 44.0;
    _itemSize = (body_h/10.0).ceilToDouble();

    boxPadding = 10.0;

    priceMargin = 0.0;

    return Expanded(
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    height: body_h,
                    child: ListView.builder(
                        controller: _scrollControllerTop,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        itemExtent: _itemSize,
                        itemBuilder: (context, index) {
                          return Row(
                            children: <Widget>[
                              Expanded(
                                flex:1,
                                child: Container(),
                              ),
                              Expanded(
                                flex:2,
                                child: Container(
                                  margin: EdgeInsets.only(right: 5.0),
                                  child: Text(
                                    "${list_up_pr[index].waitAmount.toStringAsFixed(0).replaceAllMapped(reg, mathFunc)}",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.right,),
                                ),
                              ),
                              Expanded(
                                  flex:3,
                                  child: Container(
                                    margin:EdgeInsets.only(top: priceMargin),
                                    decoration:
                                    (list_up_pr[index].price == currentPrice) ?
                                    BoxDecoration(border: Border.all(color: Colors.deepOrange, width: 2.0))
                                        :
                                    null,
                                    child: Container(
                                      color: Color(0xFFf3fafd),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              alignment: Alignment.centerRight,
                                              height: _itemSize,
                                              child: Text(
                                                "${list_up_pr[index].price.toStringAsFixed(0).replaceAllMapped(reg, mathFunc)}",
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                                textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              alignment: Alignment.centerRight,
                                              margin: EdgeInsets.only(right: 10.0),
                                              height: _itemSize,
                                              child: Text(
                                                "${list_up_pr[index].ratio}",
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                                textAlign: TextAlign.left,),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                              ),
                            ],
                          );
                        }
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    height: body_h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('52주(고)', style: TextStyle(fontSize: 12.0),),
                            Text(pi.top52.toStringAsFixed(0).replaceAllMapped(reg, mathFunc), style: TextStyle(fontSize: 12.0),),
                          ],
                        ),
                        SizedBox(height: boxPadding),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('52주(저)', style: TextStyle(fontSize: 12.0),),
                            Text(pi.bottom52.toStringAsFixed(0).replaceAllMapped(reg, mathFunc), style: TextStyle(fontSize: 12.0),),
                          ],
                        ),
                        SizedBox(height: boxPadding),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('VI기준', style: TextStyle(fontSize: 12.0),),
                            Text(pi.vi.toStringAsFixed(0).replaceAllMapped(reg, mathFunc), style: TextStyle(fontSize: 12.0),),
                          ],
                        ),
                        SizedBox(height: boxPadding),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('상승VI', style: TextStyle(fontSize: 12.0),),
                            Text(pi.vi_up.toStringAsFixed(0).replaceAllMapped(reg, mathFunc), style: TextStyle(fontSize: 12.0),),
                          ],
                        ),
                        SizedBox(height: boxPadding),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('하락VI', style: TextStyle(fontSize: 12.0),),
                            Text(pi.vi_down.toStringAsFixed(0).replaceAllMapped(reg, mathFunc), style: TextStyle(fontSize: 12.0),),
                          ],
                        ),
                        SizedBox(height: boxPadding),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('상한가', style: TextStyle(fontSize: 12.0),),
                            Text(pi.top_limit.toStringAsFixed(0).replaceAllMapped(reg, mathFunc), style: TextStyle(fontSize: 12.0),),
                          ],
                        ),
                        SizedBox(height: boxPadding),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('하한가', style: TextStyle(fontSize: 12.0),),
                            Text(pi.bottom_limit.toStringAsFixed(0).replaceAllMapped(reg, mathFunc), style: TextStyle(fontSize: 12.0),),
                          ],
                        ),
                        SizedBox(height: boxPadding),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('전거', style: TextStyle(fontSize: 12.0),),
                            Text(pi.pre_trade_amount.toStringAsFixed(0).replaceAllMapped(reg, mathFunc), style: TextStyle(fontSize: 12.0),),
                          ],
                        ),
                        SizedBox(height: boxPadding),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('전종', style: TextStyle(fontSize: 12.0),),
                            Text(pi.pre_end.toStringAsFixed(0).replaceAllMapped(reg, mathFunc), style: TextStyle(fontSize: 12.0),),
                          ],
                        ),
                        SizedBox(height: boxPadding),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('시가', style: TextStyle(fontSize: 12.0),),
                            Text(pi.start.toStringAsFixed(0).replaceAllMapped(reg, mathFunc), style: TextStyle(fontSize: 12.0),),
                          ],
                        ),
                        SizedBox(height: boxPadding),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('고가', style: TextStyle(fontSize: 12.0),),
                            Text(pi.top.toStringAsFixed(0).replaceAllMapped(reg, mathFunc), style: TextStyle(fontSize: 12.0),),
                          ],
                        ),
                        SizedBox(height: boxPadding),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('저가', style: TextStyle(fontSize: 12.0),),
                            Text(pi.bottom.toStringAsFixed(0).replaceAllMapped(reg, mathFunc), style: TextStyle(fontSize: 12.0),),
                          ],
                        ),
                        SizedBox(height: boxPadding),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.brightness_1, color: Colors.deepOrange, size: 7.0,),
                            SizedBox(width: 5.0),
                            Icon(Icons.brightness_1, color: Colors.black26, size: 7.0,),
                          ],
                        ),
                        SizedBox(height: boxPadding),
                        Container(

                          height: 26.0,
                          width: double.infinity,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 5.0, right: 5.0),
                          padding: EdgeInsets.only(top: 2.0),
                          decoration: BoxDecoration(
                              border: Border.all()
                          ),
                          child: Text("10호가"),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: body_h,
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: boxPadding),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                child: Text('체결강도', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: Text('22.07', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: boxPadding),
                        Expanded(
                          child: ListView.builder(
                            controller: _scrollControllerLeftDown,
                            itemCount: 100,
                            itemExtent: 25.0,
                            itemBuilder: (context, index) {
                              return Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text('1,745',style: TextStyle(fontSize: 12.0),),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      child: Text('1,111',style: TextStyle(fontSize: 12.0),),
                                    ),
                                  ),
                                ],
                              );
                            },
                          )
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: body_h,
                    child: ListView.builder(
                        controller: _scrollControllerDown,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        itemExtent: _itemSize,
                        itemBuilder: (context, index) {
                          return Row(
                            children: <Widget>[
                              Expanded(
                                flex:3,
                                child: Container(
                                  margin:EdgeInsets.only(top: priceMargin),
                                  decoration:
                                  (list_down_pr[index].price == currentPrice) ?
                                    BoxDecoration(border: Border.all(color: Colors.deepOrange, width: 2.0))
                                    :
                                    null,
                                  child: Container(
                                    color: Color(0xFFFFF2F2),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            height: _itemSize,
                                            child: Text(
                                              "${list_down_pr[index].price.toStringAsFixed(0).replaceAllMapped(reg, mathFunc)}",
                                              style: TextStyle(fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            margin: EdgeInsets.only(right: 10.0),
                                            height: _itemSize,
                                            child: Text(
                                              "${list_down_pr[index].ratio}",
                                              style: TextStyle(fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.left,),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex:2,
                                child: Container(
                                  margin: EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    "${list_down_pr[index].waitAmount.toStringAsFixed(0).replaceAllMapped(reg, mathFunc)}",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,),
                                ),
                              ),
                              Expanded(
                                flex:1,
                                child: Container(),
                              ),
                            ],
                          );
                        }
                    ),
                  ),
                )
              ],
            )
          ],
        )
      ),
    );
  }
}
