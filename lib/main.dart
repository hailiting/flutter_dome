
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
// 如何导入和使用Flutter资源文件 img
import "package:routerApp/res_page.dart";
// Widget 生命周期
import "package:routerApp/app_lifecycle_page.dart";
// App 生命周期
import "package:routerApp/widget_lifecycle_page.dart";
// 动画学习
import "package:routerApp/animation_page.dart";

void main()=>runApp(Myapp());
class Myapp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<Myapp> {
  static const IconData trade =IconData(0xe6d6, fontFamily: "icontfont");
  Brightness _brightness = Brightness.light;
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Flutter Dome",
      theme: ThemeData(
        // 全局设置字体
        // fontFamily: "icontfont",
        // 主题控制
        brightness: _brightness,
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("如何创建Flutter的路由与导航"),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(trade, color: Colors.orange),
          ),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: (){
                setState((){
                  if(_brightness == Brightness.dark){
                    _brightness=Brightness.light;
                  }else{
                    _brightness=Brightness.dark;
                  }
                });
              },
              child: Text("切换主题"),
            ),
            RouteNavigator(),
          ],
        )
      ),
      routes: <String, WidgetBuilder>{
        "plugin": (BuildContext context)=> PluginUse(),
        "less": (BuildContext context)=> LessGroupPage(),
        "ful": (BuildContext context)=> StatefulGroup(),
        "layout": (BuildContext context)=>FlutterLayoutPage(),
        "gesture": (BuildContext context)=>GesturePage(),
        "launch": (BuildContext context)=>LaunchPage(),
        "photo": (BuildContext context)=>PhotoApp(),
        "res": (BuildContext context)=>ResPage(),
        "app_lifecycle": (BuildContext context)=>AppLifecycle(),
        "widget_lifecycle": (BuildContext context)=>WidgetLifecycle(),
        "animation": (BuildContext context)=> AnimationPage(),
      },
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
      padding: EdgeInsets.all(20),
      child: Wrap(
        spacing: 8,
        runSpacing: 12,
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
          _item("手势事件学习", GesturePage(), "gesture"),
          _item("打开第三方页面 or app", LaunchPage(), "launch"),
          _item("加载外部资源", ResPage(), "res"),
          _item("Widget生命周期", WidgetLifecycle(), "widget_lifecycle"),
          _item("App生命周期", AppLifecycle(), "app_lifecycle"),
          _item("照相机小dome", PhotoApp(), "photo"),
          _item("动画学习", AnimationPage(), "animation"),
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