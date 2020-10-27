
import 'package:flutter/material.dart';

class ResPage extends StatefulWidget {
  @override
  _ResPageState createState() => _ResPageState();
}

class _ResPageState extends State<ResPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AssetImage("images/loge.jpg")
      body: Image.asset("images/loge.jpg"),
    );
  }
}
