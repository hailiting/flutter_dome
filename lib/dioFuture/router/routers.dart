import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './router_handler.dart';
class Routes {
  static String loginPage = "/login_page";
  static void configureRoutes(FluroRouter router){
    /// 没有路由的错误
    router.notFoundHandler = widgetNotFoundHandler;
    router.define(loginPage, handler: loginHandler);
  }
}