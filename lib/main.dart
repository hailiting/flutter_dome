import "package:flutter/material.dart";
// flutter 布局基础
import 'package:routerApp/flutter_layout_page.dart';
// stateless 组件基础
import 'package:routerApp/less_group_page.dart';
// Stateful 组件基础
import 'package:routerApp/stateful_group_page.dart';
// 插件应用
import 'package:routerApp/plugin_use.dart';
// flutter 手势事件
import 'package:routerApp/gesture_page.dart';
// 借助插件，打开第三方
import "package:routerApp/launch_page.dart";
// 拍照，获取照片 dome
import "package:routerApp/photo_app_page.dart";
// 如何导入和使用Flutter资源文件 【iconfont等】
import "package:routerApp/res_page.dart";



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
        "gesture": (BuildContext context)=>GesturePage(),
        "launch": (BuildContext context)=>LaunchPage(),
        "photo": (BuildContext context)=>PhotoAppage(),
        "res": (BuildContext context)=>ResPage(),
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
          _item("手势事件学习", GesturePage(), "layout"),
          _item("打开第三方页面 or app", LaunchPage(), "layout"),
          _item("加载外部资源", ResPage(), "layout"),
          _item("照相机小dome", PhotoAppage(), "layout"),
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