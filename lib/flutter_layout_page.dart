import 'package:flutter/material.dart';

// 如何进行flutter布局开发
class FlutterLayoutPage extends StatefulWidget {
  @override
  _FlutterLayoutPageState createState() => _FlutterLayoutPageState();
}

class _FlutterLayoutPageState extends State<FlutterLayoutPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "如何进行flutter布局开发",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("如何进行flutter布局开发"),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.blue,
                ),
                label: "首页",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.list,
                  color: Colors.blue,
                ),
                label: "列表",
              ),
            ]),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Text("点我"),
        ),
        body: _currentIndex == 0
            ? RefreshIndicator(
                child: ListView(
                  children: <Widget>[
                    Container(
                        decoration: BoxDecoration(color: Colors.white),
                        alignment: Alignment.center,
                        child: Column(children: <Widget>[
                          Row(
                            children: <Widget>[
                              ClipOval(
                                child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Image.network(
                                      "http://www.devio.org/img/avatar.png"),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: ClipRRect(
                                  //圆角
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  child: Opacity(
                                    opacity: 0.6,
                                    child: Image.network(
                                      "http://www.devio.org/img/avatar.png",
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TextField(
                              // 输入文本样式
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  hintText: "请输入",
                                  hintStyle: TextStyle(
                                    fontSize: 15,
                                  ))),
                          Container(
                            height: 100,
                            margin: EdgeInsets.all(10),
                            child: PhysicalModel(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(6),
                              clipBehavior: Clip.antiAlias,
                              child: PageView(
                                children: <Widget>[
                                  _item("page1", Colors.deepPurple),
                                  _item("page2", Colors.green),
                                  _item("page3", Colors.blue),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              FractionallySizedBox(
                                  widthFactor: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.greenAccent),
                                    child: Text("宽度撑满"),
                                  ))
                            ],
                          )
                        ])),
                    Stack(
                      children: <Widget>[
                        Image.network(
                          "http://www.devio.org/img/avatar.png",
                          width: 100,
                          height: 100,
                        ),
                        Positioned(
                            left: 0,
                            bottom: 0,
                            child: Image.network(
                              "http://www.devio.org/img/avatar.png",
                              width: 36,
                              height: 36,
                            ))
                      ],
                    ),
                    Wrap(
                      // wrap布局，从左到右进行排列，会自动换行
                      spacing: 8,
                      runSpacing: 6,
                      children: <Widget>[
                        _chip("Flutter"),
                        _chip("进阶"),
                        _chip("实战"),
                        _chip("携程"),
                        _chip("app"),
                      ],
                    )
                  ],
                ),
                onRefresh: _handleRefresh)
            : Column(
                children: <Widget>[
                  Text("列表"),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                      child: Text("拉伸填满"),
                    ),
                  )
                ],
              ),
      ),
    );
  }

  _chip(String label) {
    return Chip(
      label: Text(label),
      avatar: CircleAvatar(
          backgroundColor: Colors.blue.shade900,
          child: Text(
            label.substring(0, 1),
            style: TextStyle(fontSize: 10),
          )),
    );
  }

  _item(String title, MaterialColor color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(
        title,
        style: TextStyle(fontSize: 22, color: Colors.white),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 200));
    return null;
  }
}
