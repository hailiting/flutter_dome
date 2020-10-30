import 'package:flutter/material.dart';
import 'package:routerApp/dome01/pages/homePage.dart';
import 'package:routerApp/dome01/pages/myPage.dart';
import 'package:routerApp/dome01/pages/searchPage.dart';
import 'package:routerApp/dome01/pages/travelPage.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;
  final PageController _controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: _controller,
          children: [
            HomePage(),
            SearchPage(),
            TravelPage(),
            MyPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index){
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex= index;
            });
          },
          items: [
            _renderNavigationBarItem(Icons.home, "home"),
            _renderNavigationBarItem(Icons.search, "search"),
            _renderNavigationBarItem(Icons.camera, "travel"),
            _renderNavigationBarItem(Icons.person, "my"),
          ],
        ));
  }

  BottomNavigationBarItem _renderNavigationBarItem(IconData icon, String label) {
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
          color: _defaultColor,
        ),
        activeIcon: Icon(
          icon,
          color: _activeColor,
        ),
        label: label
    );
  }
}
