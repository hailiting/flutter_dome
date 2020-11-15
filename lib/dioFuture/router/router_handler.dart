import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:routerApp/dioFuture/ui/page/user/login_page.dart';
import 'package:routerApp/dioFuture/ui/page/tab/tab_navigator.dart';
import 'package:routerApp/dioFuture/ui/page/error_page.dart';
// app main page
var mainHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    return new TabNavigator();
  }
);
/// 无路由边界
var widgetNotFoundHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    return WidgetNotFound();
  }
);
/// 登录页
var loginHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    return new LoginPage();
  }
);
// /// 跳转网页
// var pushWebHandler = new Handler(
//   handlerFunc: (BuildContext context, Map<String, List<String>> params){
//     String paramsStr = params["data"]?.first;
//     String title  = params["title"]?.first;
//     String url = params["url"]?.first;
//     String allUrl = params["allUrl"]?.first;
//     String showAppBar  = params["showAppBar"]?.first;
//     Map data = json.decode(paramsStr);
//     if(allUrl !=  null){
//       allUrl =  Uri.decodeComponent(allUrl);
//     }
//     if(url!=null){
//       final List signArr = url.split("/");
//       if(signArr.contains("eduction_major_info")){
//         url="education_major_info/"+Uri.encodeComponent(signArr.last);
//       } else  if(signArr.contains("sign_up_small")){
//         url = "sign_up_small/${signArr[1]}/"+Uri.encodeComponent(signArr.last);
//       } else{
//         url =  Uri.decodeComponent(url);
//       }
//     }
//     return new WebScaffold(
//       title:title,
//       url: url,
//       allUrl: allUrl,
//       data: data,
//       showAppBar: ShowAppBar=="1"?true:false;
//     )
//   }
// );
//



