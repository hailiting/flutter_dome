import 'package:flutter/material.dart';

class LessGroupPage extends StatefulWidget {
  @override
  _LessGroupPageState createState() => _LessGroupPageState();
}

class _LessGroupPageState extends State<LessGroupPage> {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
    Text title =Text("StatefulWidget与基础组件");
    return MaterialApp(
      title: "StatefulWidget",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title:title,
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          )
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.blue[50]),
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                "I am text",
                style: textStyle,
              ),
              Icon(
                Icons.android,
                size: 50,
                color: Colors.red,
              ),
              CloseButton(),
              BackButton(),
              Chip(
                // 材料设计中一个非常有趣的小部件
                avatar: Icon(Icons.people),
                label: title,
              ),
              Divider(
                height: 10,  // 容器高度，不是线的高度
                indent: 10, // 左侧间距
                color: Colors.orange[50],
              ),
              Card(
                // 带有圆角，阴影，边框等效果卡片
                color: Colors.blue,
                elevation: 5,
                margin: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "I am Card",
                    style: textStyle,
                  ),
                ),
              ),
              AlertDialog(
                title: Text("盘他"),
                content: Text("哦 这天好蓝"),
              )
            ],
          ),
        )
      )
    );
  }
}
