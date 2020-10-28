import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("动画学习"),
          leading: BackButton(),
        ),
        body: Center(
            child: Column(
          children: [
            Text(animation.value.toString()),
            MyAnimation(),
            GestureDetector(
              onTap: () {
                controller.reset();
                controller.forward();
              },
              child: AnimatedIcon(animation: animation),
            ),
            GrowTransition(
              animation: animation,
              child: Image.network(
                "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2538000272,1096467066&fm=26&gp=0.jpg",
              ),
            ),
          ],
        )));
  }
}

// 3. AnimatedBuilder
class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});
  final Widget child;
  final Animation<double> animation;
  Widget build(BuildContext context) {
    print("animation: ${animation.value}");
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Container(
            height: animation.value*100,
            width: animation.value*100,
            decoration: BoxDecoration(color: Colors.blue),
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}

// 2. AnimationWidget
class AnimatedIcon extends AnimatedWidget {
  AnimatedIcon({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Icon(
      Icons.check,
      color: Colors.black,
      size: 30.0 + 100.0 * animation.value,
    );
  }
}

// 1. 用事件监听来写动画
class MyAnimation extends StatefulWidget {
  @override
  _MyAnimation createState() => _MyAnimation();
}

class _MyAnimation extends State<MyAnimation>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  AnimationStatus animationStatus;
  double animationValue;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 100).animate(controller)
      // .. 表示返回值   =  animation.addListener((){});
      // 动画的监听
      ..addListener(() {
        setState(() {
          animationValue = animation.value;
        });
      })

      // state的监听
      ..addStatusListener((AnimationStatus status) {
        setState(() {
          animationStatus = status;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          GestureDetector(
            child: RaisedButton(
              onPressed: () {
                controller.reset();
                controller.forward();
              },
              child: Text(
                "start",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Text("animationStatus: $animationStatus,"),
          Text(" animationValue: $animationValue"),
          Text(""),
          Container(
            decoration: BoxDecoration(color: Colors.yellow),
            width: animationValue,
            height: animationValue,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
