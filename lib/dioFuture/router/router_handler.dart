import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:routerApp/dioFuture/ui/page/user/login_page.dart';

// app main page
var mainHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    return new TabNavigator();
  }
)