import 'package:flutter/material.dart';

/// StatefulWidget
/// 1. 初始化时期
/// createState、initState
/// 2. 更新申请
/// didChangeDependencies、build、didUpdateWidget
/// 3. 销毁期
/// deactivate、dispose
///
class WidgetLifecycle extends StatefulWidget {
  @override
  _WidgetLifecycleState createState() => _WidgetLifecycleState();
}

class _WidgetLifecycleState extends State<WidgetLifecycle> {
  int _count = 0;
  @override
  void initState() {
    print("------initState------");
    super.initState();
    _count += 1;
    print("------initState  1------");
  }


  ///当依赖的State对象改变时会调用：
  ///a.在第一次构建widget时，在initState（）之后立即调用此方法；
  ///b.如果的StatefulWidgets依赖于InheritedWidget，那么当当前State所依赖InheritedWidget中的变量改变时会再次调用它
  @override
  void didChangeDependencies() {
    print("------didChangeDependencies------");
    super.didChangeDependencies();
    _count += 1;
    print("------didChangeDependencies   1------");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Widget 生命周期"),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
            )),
        body: Center(
          child: Column(
            children: [
              RaisedButton(
                onPressed: () {
                  setState(
                    () {
                      _count += 1;
                    },
                  );
                },
                child: Text("_count+1"),
              ),
              Text("当前_count为：$_count"),
            ],
          ),
        ));
  }
  @override
  /// 父组件重新绘制的时候调用
  void didUpdateWidget(WidgetLifecycle oldWidget){
    print("------didUpdateWidget-------");
    super.didUpdateWidget(oldWidget);
    setState(() {
      _count+=1;
    });
  }
  /// dispose之前调用
  @override
  void deactivate(){
    print("------deactivate-------");
    super.deactivate();
  }
  /// 组件在被销毁的时候调用
  @override
  void dispose() {
    print("------dispose-------");
    super.dispose();
  }
}
