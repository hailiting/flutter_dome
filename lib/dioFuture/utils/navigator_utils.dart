import 'package:flutter/material.dart';
import 'dart:convert' show json;
import 'package:fluro/fluro.dart';

import 'package:routerApp/dioFuture/utils/utils.dart';
import 'package:routerApp/dioFuture/router/application.dart';
import 'package:routerApp/dioFuture/router/routers.dart';

class NavigatorUtils {
  static Future navigateTo(
      {@required BuildContext context,
      @required String path,
      Map<String, Object> data}) {
    if (!Utils.isEmptyMap(data)) {
      String query = urlEncodeMap(data);
      path += (path.contains("?") ? "&" : "?") + query;
    }
    if (path == Routes.mainPage) {
      return Application.router.navigateTo(context, path);
    } else {
      return Application.router
          .navigateTo(context, path, transition: TransitionType.cupertino);
    }
  }

  static Future navigateToWeb({
    @required BuildContext context,
    String url,
    String allUrl,
    String title,
    bool showAppBar = true,
    Map<String, String> data,
  }) {
    String dataStr;
    if (data != null) {
      dataStr = json.encode(data);
    }
    String realAllUrl;
    if (allUrl != null) {
      realAllUrl = Uri.encodeComponent(allUrl);
    }
    String realUrl;
    if (url != null) {
      realUrl = Uri.encodeComponent(url);
    }
    String showAppBarStr = showAppBar ? "1" : "0";
    String entTitle;
    if (title != null) {
      entTitle = Uri.encodeComponent(title);
    }
    return Application.router.navigateTo(
        context,
        Routes.webPage +
            '?url=$realUrl&title=$entTitle&data=$dataStr&allUrl=$realAllUrl&showAppBar=$showAppBarStr',
        transition: TransitionType.cupertino);
  }

  static String urlEncodeMap(data) {
    StringBuffer urlData = new StringBuffer("");
    bool first = true;
    void urlEncode(dynamic sub, String path) {
      if (sub is List) {
        for (int i = 0; i < sub.length; i++) {
          urlEncode(sub[i],
              "$path%5B${(sub[i] is Map || sub[i] is List) ? i : ''}%5D");
        }
      } else if (sub is Map) {
        sub.forEach((k, v) {
          if (path == "") {
            urlEncode(v, "${Uri.encodeQueryComponent(k)}");
          } else {
            urlEncode(v, "$path%5B${Uri.encodeQueryComponent(k)}%5D");
          }
        });
      } else {
        if(!first){
          urlData.write("&");
        }
        first =  false;
        urlData.write("$path=${Uri.encodeQueryComponent(sub.toString())}");
      }
    }
    urlEncode(data, "");
    return urlData.toString();
  }
  static void goBack(BuildContext context){
    Navigator.pop(context);
  }
  /// 带参数的返回
  static void goBackWithParams(BuildContext context, result){
    Navigator.pop(context, result);
  }
  /// 路由返回指定页面
  static void goBackUrl(BuildContext context, String title){
    Navigator.popAndPushNamed(context, title);
  }
  static void goHomePage(BuildContext context){
    Application.router.navigateTo(context, Routes.mainPage, replace: true);
  }

}
