import 'dart:async';
import 'dart:ui';
import 'package:fluro/fluro.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

import 'package:routerApp/dioFuture/config/app_config.dart';
import 'package:routerApp/dioFuture/config/index.dart';
import 'package:routerApp/dioFuture/config/resource_mananger.dart';
import 'package:routerApp/generated/l10n.dart';
import 'package:routerApp/dioFuture/router/routers.dart';
import 'package:routerApp/dioFuture/router/application.dart';
import 'package:routerApp/dioFuture/utils/sp_utils.dart';
import 'package:routerApp/dioFuture/utils/user_sharedInstance.dart';
import 'package:routerApp/dioFuture/view_model/login_model.dart';

// 启动页
class SplashPage extends StatefulWidget{
  @override
  _SplashPageState createState()=>_SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin{
  AnimationController _logoController;
  Animation<double> _animation;
  AnimationController _countdownController;
  @override
  void initState(){
    _logoController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500)
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(curve: Curves.easeInOutBack, parent: _logoController);
    );
    _animation.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        _logoController.reverse();
      } else if(status == AnimationStatus.dismissed){
        _logoController.forward();
      }
    });
    _logoController.forward();
    _countdownController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3)
    );
    _countdownController.forward();

    WidgetsBinding.instance.addPostFrameCallback((callback) {
      _initAsync();
    });
    super.initState();
  }
  void _initAsync() async {
    UserSharedInstance().discipline = SpUtils.getDiscipline();
    if(SpUtils.getPhonePassword()!=null){
      Map value = SpUtils.getPhonePassword();
      print("getPhonePassword $value");
      String phone = value[AppConfig.KEY_SPLASH_PHONE];
      String password = value[AppConfig.KEY_SPLASH_PASSWORD];
      await LoginModel(Provider.of(context, listen: false))
          .login(loginName: phone,password: password);
    }
  }
  @override
  void dispose(){
    _logoController.dispose();
    _countdownController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    ScreenUtil.init(context, designSize: Size(750, 1334), allowFontScaling: true);
    return Scaffold(
      body: WillPopScope(
        onWillPop: ()=>Future.value(false),
        child: Stack(fit: StackFit.expand,children: <Widget>[
          Image.asset(
            ImageHelper.wrapAssets("main_bg"),
            fit: BoxFit.fill
          ),
          AnimatedFlutterLogo(
            animation: _animation
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SafeArea(
              child: InkWell(
                onTap: (){
                  nextPage(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  margin: EdgeInsets.only(right: 20, bottom: 20),
                  child: AnimatedCountdown(
                    context: context,
                    animation: StepTween(begin: 3, end: 0).animate(_countdownController),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: InkWell(
                onTap: (){

                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  alignment: AlignmentDirectional.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: ScreenWH.rsw(133),
                        height: ScreenWH.rsh(1),
                        color: Colours.color_white,
                        margin: EdgeInsets.only(right: ScreenWH.rsw(30)),
                      ),
                      Text('-----', style: TextStyle(color: Colours.color_white, fontSize: ScreenWH.rsSp(24)),),
                      Container(
                        margin: EdgeInsets.only(right: ScreenWH.rsw(30)),
                        width: ScreenWH.rsw(133),
                        height: ScreenWH.rsh(1),
                        color: Colours.color_white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],),
      ),
    );
  }
}
class AnimatedCountdown extends AnimatedWidget{
  final Animation<int> animation;
  AnimatedCountdown({key, this.animation, context}):super(key: key, listenable: animation){
    this.animation.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        nextPage(context);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Text("", style: TextStyle(color: Colors.white),);
  }
}
class AnimatedFlutterLogo extends AnimatedWidget {
  AnimatedFlutterLogo({
    Key key,
    Animation<double> animation,
}):super(key:  key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return AnimatedAlign(
      duration:Duration(milliseconds: 10),
      alignment: Alignment(0, animation.value*0.3),
      curve: Curves.bounceOut,
      child: Image.asset(
        ImageHelper.wrapAssets("common/app_logo"),
        width: ScreenWH.rsw(180),
        height: ScreenWH.rsw(180),
      ),
    );
  }
}

class AnimatedAndroidLoge extends AnimatedWidget {
  AnimatedAndroidLoge({
    Key key,
    Animation<double> animation
}):super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
final Animation<double> animation = listenable;
return Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: <Widget>[
    Image.asset(
      ImageHelper.wrapAssets("common/app_loge"),
      width: ScreenWH.rsw(180)*(1-animation.value),
      height: ScreenWH.rsw(180)*(1-animation.value),
    ),
  ],
);
  }
}
void nextPage(context){
  Application.router.navigateTo(context, Routes.mainPage, replace: true, transition: TransitionType.native);
}
class GuidePage extends StatefulWidget{
  static const List<String> images = <String>[
    "guide_page_1.png",
    "guide_page_2.png",
    "guide_page_3.png",
    "guide_page_4.png",
  ];
  @override
  _GuidePageState createState()=>_GuidePageState();
}
class _GuidePageState extends State<GuidePage>{
  int curIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Stack(
          alignment: Alignment(0, 0.87),
          children: [
            Swiper(
              itemBuilder: (ctx, index)=>Image.asset(
                "assets/images/${GuidePage.images[index]}",
                fit: BoxFit.fill,
              ),
              itemCount: GuidePage.images.length,
              loop: false,
              onIndexChanged: (index){
                setState(() {
                  curIndex=index;
                });
              },
            ),
            Offstage(
              offstage: curIndex!=GuidePage.images.length -1,
              child: CupertinoButton(
                color: Theme.of(context).primaryColorDark,
                child: Text("点我开始"),
                onPressed: (){
                  nextPage(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
