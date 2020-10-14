import 'package:flutter/material.dart';
import 'package:smartm/pages/demo_page.dart';
import 'package:smartm/pages/demo_page2.dart';

class TapPage extends StatefulWidget {

  int tapIndex; // 탭화면 인덱스 수신
  TapPage({Key key, @required this.tapIndex}) : super(key: key);

  @override
  _TapPageState createState() => _TapPageState();

}

class _TapPageState extends State<TapPage> {

  int _selectedIdx = 0;

  List _pages = [
    DemoPage2(txt: "메뉴"), // 0
    DemoPage2(txt: "스마트 홈"), // 1
    DemoPage2(txt: "관심 종목"), // 2
    DemoPage(), // 3
    DemoPage2(txt: "주식 주문"), // 4
    DemoPage2(txt: "자산 현황"), // 5
    DemoPage2(txt: "주식 잔고"), // 6
  ];

  @override
  Widget build(BuildContext context) {

    debugPrint("widget.tapIndex : ${widget.tapIndex}");
    if(widget.tapIndex != null) { // widget 은 현재 State에 선언된 변수를 참조할때 사용, this 같은 의미
      _selectedIdx = widget.tapIndex;
      widget.tapIndex = null;
    }

    return Scaffold(
        body: Center(
          child: _pages[_selectedIdx],
        ),
        bottomNavigationBar:
        SizedBox(
        height: 92,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.black87,
          onTap: _onTapped,
          currentIndex: _selectedIdx,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.menu, color: Colors.deepOrange),
                title: Text('')
            ),
            BottomNavigationBarItem(
                icon: Text('스마트\n홈', textAlign: TextAlign.center),
                activeIcon: Text('스마트\n홈', textAlign: TextAlign.center),
                title: Text('')
            ),
            BottomNavigationBarItem(
                icon: Text('관심\n종목', textAlign: TextAlign.center),
                activeIcon: Text('관심\n종목', textAlign: TextAlign.center),
                title: Text('')
            ),
            BottomNavigationBarItem(
                icon: Text('주식\n현재가', textAlign: TextAlign.center),
                activeIcon: Text('주식\n현재가', textAlign: TextAlign.center),
                title: Text('')
            ),
            BottomNavigationBarItem(
                icon: Text('주식\n주문', textAlign: TextAlign.center),
                activeIcon: Text('주식\n주문', textAlign: TextAlign.center),
                title: Text('')
            ),
            BottomNavigationBarItem(
                icon: Text('자산\n현황', textAlign: TextAlign.center),
                activeIcon: Text('자산\n현황', textAlign: TextAlign.center),
                title: Text('')
            ),
            BottomNavigationBarItem(
                icon: Text('주식\n잔고', textAlign: TextAlign.center),
                activeIcon: Text('주식\n잔고', textAlign: TextAlign.center),
                title: Text('')
            ),

          ],
        )
        )


    );
  }

  void _onTapped(int idx) {
    setState(() {
      _selectedIdx = idx;
    });
  }
}
