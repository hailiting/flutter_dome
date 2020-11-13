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
}