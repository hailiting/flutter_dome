import 'package:flutter/material.dart';
import 'package:routerApp/dioFuture/ui/widget/scaffold_custom.dart';

class WidgetNotFound extends StatelessWidget{
  Widget build(BuildContext context){
    return ScaffoldCustom(
      title: "页面错误",
      body:Center(
        child: Text("页面错误"),
      )
    );
  }
}