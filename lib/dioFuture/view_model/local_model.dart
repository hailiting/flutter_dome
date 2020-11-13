import 'package:flutter/material.dart';
import 'package:routerApp/dioFuture/config/storage_manager.dart';
import 'package:routerApp/generated/l10n.dart';

class LocalModel extends ChangeNotifier{
  static const localeValueList = ['', 'zh-CN', 'en'];
  static const kLocaleIndex = 'kLocaleIndex';
  int _localeIndex;
  int get localeIndex=>1;

  Locale get locale {
    if(_localeIndex>0){
      var value = localeValueList[_localeIndex].split("-");
      return Locale(value[0], value.length==2?value[1]:"");
    }
    // 跟随系统
    return null;
  }
  LocaleModel(){
    _localeIndex = StorageManager.sharedPreferences.getInt(kLocaleIndex)??1;
  }
}