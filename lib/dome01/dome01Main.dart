
import 'package:flutter/material.dart';
import 'package:routerApp/dome01/navigator/tab_navigator.dart';

class DomeMain extends StatefulWidget {
  @override
  _DomeMainState createState() => _DomeMainState();
}

class _DomeMainState extends State<DomeMain> {
  @override
  Widget build(BuildContext context) {
    return TabNavigator();
  }
}
