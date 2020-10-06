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

    currentPrice = 1000;

    setList();
    demoDataLoop();

    // onload개념, 화면 다 그려진다음 행할 액션 적용
    WidgetsBinding.instance.addPostFrameCallback((_) => onload());
  }

  void onload() {
    _scrollController.jumpTo(_itemSize * 5.0);
    //_scrollController.animateTo(_itemSize * 5.0, duration: Duration(milliseconds: 300), curve: Curves.ease);

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

    if(screen_h == 0.0){
      screen_h = MediaQuery.of(context).size.height;
      // body 높이는 스크린높이에서 앱바(60), 헤더(120), 풋터(60), 탭바(92)를 뺀 값
      body_h = screen_h - 60.0 - 120.0 - 60.0 - 92.0;
      _itemSize = body_h/11.0;
    }

    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: 20,
        itemExtent: _itemSize,
        itemBuilder: (context, index) {
          return (index < 10 ?
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex:1,
                  child: Container(
                    child: Text("",textAlign: TextAlign.center,),
                  ),
                ),
                Expanded(
                  flex:1,
                  child: Container(
                    child: Text(
                      "${list_up_pr[index].waitAmount.toStringAsFixed(0).replaceAllMapped(reg, mathFunc)}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,),
                  ),
                ),
                Expanded(
                  flex:2,
                  child: Container(
                    color:Color(0xFFE5E5FF),
                    height: _itemSize,
                    alignment: Alignment.center,
                    child: Text(
                      "${list_up_pr[index].price.toStringAsFixed(0).replaceAllMapped(reg, mathFunc)}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,),
                  ),
                ),
                Expanded(
                  flex:1,
                  child: Container(
                    color:Color(0xFFE5E5FF),
                    height: _itemSize,
                    alignment: Alignment.center,
                    child: Text(
                      "${list_up_pr[index].ratio}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,),
                  ),
                ),Expanded(
                  flex:1,
                  child: Container(
                    child: Text("", textAlign: TextAlign.center,),
                  ),
                ),
                Expanded(
                  flex:1,
                  child: Container(
                    child: Text("",textAlign: TextAlign.center,),
                  ),
                ),
              ],
            ),
          ) :
          Container(

            height: 200.0,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex:1,
                  child: Container(
                    child: Text("",textAlign: TextAlign.center,),
                  ),
                ),
                Expanded(
                  flex:1,
                  child: Container(
                    child: Text("", textAlign: TextAlign.center,),
                  ),
                ),
                Expanded(
                  flex:2,
                  child: Container(
                    color:Color(0xFFFFE5E5),
                    height: _itemSize,
                    alignment: Alignment.center,
                    child: Text("${list_down_pr[index-10].price.toStringAsFixed(0).replaceAllMapped(reg, mathFunc)}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,),
                  ),
                ),
                Expanded(
                  flex:1,
                  child: Container(
                    color:Color(0xFFFFE5E5),
                    height: _itemSize,
                    alignment: Alignment.center,
                    child: Text("${list_down_pr[index-10].ratio}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,),
                  ),
                ),
                Expanded(
                  flex:1,
                  child: Container(
                    child: Text("${list_down_pr[index-10].waitAmount.toStringAsFixed(0).replaceAllMapped(reg, mathFunc)}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,),
                  ),
                ),
                Expanded(
                  flex:1,
                  child: Container(
                    child: Text("",textAlign: TextAlign.center,),
                  ),
                ),

              ],
            ),
          ));
        },
      ),
    );
  }
}
