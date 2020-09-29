import 'package:flutter/material.dart';
import 'package:smartm/demo_page.dart';

class TapPage extends StatefulWidget {

  int tapIndex; // 탭화면 인덱스 수신
  TapPage({Key key, @required this.tapIndex}) : super(key: key);

  @override
  _TapPageState createState() => _TapPageState();

}

class _TapPageState extends State<TapPage> {

  int _selectedIdx = 0;

  List _pages = [
    DemoPage(), // 0
    DemoPage(), // 1
    DemoPage(), // 2
    DemoPage(), // 3
    DemoPage(), // 4
    DemoPage(), // 5
    DemoPage(), // 6
  ];

  @override
  Widget build(BuildContext context) {

    debugPrint("widget.tapIndex : ${widget.tapIndex}");
    if(widget.tapIndex != null) { // widget 은 현재 State에 선언된 변수를 참조할때 사용, this 같은 의미
      _selectedIdx = widget.tapIndex;
      widget.tapIndex = null;
    }

    var height = 13.0;

    return Scaffold(
        body: Center(
          child: _pages[_selectedIdx],
        ),
        bottomNavigationBar: BottomNavigationBar(
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
    );
  }

  void _onTapped(int idx) {
    setState(() {
      _selectedIdx = idx;
    });
  }
}
