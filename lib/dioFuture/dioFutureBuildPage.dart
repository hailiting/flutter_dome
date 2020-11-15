import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import "package:flutter_localizations/flutter_localizations.dart";
import 'package:fluro/fluro.dart';
import 'package:flustars/flustars.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import "package:fluwx/fluwx.dart";
import 'package:path_provider/path_provider.dart';

import 'package:routerApp/dioFuture/config/storage_manager.dart';
import 'package:routerApp/dioFuture/router/application.dart';
import 'package:routerApp/dioFuture/router/routers.dart';
import 'package:routerApp/dioFuture/ui/page/splash.dart';
import 'package:routerApp/dioFuture/utils/platform_utils.dart';
import 'package:routerApp/dioFuture/utils/user_sharedInstance.dart';
import 'package:routerApp/dioFuture/config/index.dart';
import 'package:routerApp/dioFuture/config/app_config.dart';
import 'package:routerApp/dioFuture/config/provider_manager.dart';
import 'package:routerApp/dioFuture/view_model/local_model.dart';
import 'package:routerApp/dioFuture/view_model/theme_model.dart';

import 'package:routerApp/generated/l10n.dart';

const providers = [
  ...independentServices,
  ...uiConsumableProviders,
];

class DioFutureBuildPage extends StatefulWidget {
  @override
  _DioFutureBuildPageState createState() => _DioFutureBuildPageState();
}

class _DioFutureBuildPageState extends State<DioFutureBuildPage> {
  void _init() {
    final router = new FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    _init();
    return MultiProvider(
        providers: providers,
        child: Scaffold(
          appBar: AppBar(
            title: Text("dio demo"),
            leading: BackButton(),
          ),
          body: Center(
            child: RaisedButton(
              child: Text('click me'),
              onPressed: () {},
            ),
          ),
        ));
  }
}
