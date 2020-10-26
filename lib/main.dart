import "package:flutter/material.dart";
import 'package:routerApp/flutter_layout_page.dart';
import 'package:routerApp/less_group_page.dart';
import 'package:routerApp/plugin_use.dart';
import 'package:routerApp/statefull_group_page.dart';
void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Flutter Dome",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("如何创建Flutter的路由与导航"),
        ),
        body: RouteNavigator(),
      ),
      routes: <String, WidgetBuilder>{
        "plugin": (BuildContext context)=> PluginUse(),
        "less": (BuildContext context)=> LessGroupPage(),
        "ful": (BuildContext context)=> StatefulGroup(),
        "layout": (BuildContext context)=>FlutterLayoutPage(),
      }
    );
  }
}
class RouteNavigator extends StatefulWidget {
  @override
  _RouteNavigatorState createState()=>_RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName = false;
  @override
  Widget build(BuildContext context){
    return Container(
      child: Column(
        children: <Widget>[
          SwitchListTile(
            title: Text("${byName?'':'不'}通过路由名跳转"),
            value: byName,
            onChanged: (value){
              setState((){
                byName=value;
              });
            }
          ),
          _item("如何使用Flutter包和插件", PluginUse(), "plugin"),
          _item("StatelessWidget与基础组件", LessGroupPage(), "less"),
          _item("StatefulWidget与基础组件", StatefulGroup(), "ful"),
          _item("如何进行Flutter布局开发", FlutterLayoutPage(), "layout"),
        ]
      )
    );
  }
  Widget _item(String title, page, String routeName){
    return Container(
      child: RaisedButton(
        onPressed: (){
          if(byName){
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>page));
          }
        },
        child: Text(title),
      )
    );
  }
}