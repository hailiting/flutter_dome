import 'dart:ui' show Color;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flustars/flustars.dart' as flustars;

class Colours {
  static const MaterialColor orange =
      MaterialColor(_orangePrimaryValue, <int, Color>{
    50: Color(0xFFFFF3E0),
    100: Color(0xFFFFE0B2),
    200: Color(0xFFFFCC80),
    300: Color(0xFFFFB74D),
    400: Color(0xFFFFA726),
    500: Color(_orangePrimaryValue),
    600: Color(0xFFFB8C00),
    700: Color(0xFFF57C00),
    800: Color(0xFFEF6C00),
    900: Color(0xFFE65100),
  });
  static const int _orangePrimaryValue = 0xFFFF9562;

  static const Color mainColor = Color(0xFFFF9562);
  static const Color color_FF6F2A = Color(0xFFFF6F2A);
  static const MaterialColor blue = MaterialColor(
    _bluePrimaryValue,
    <int, Color>{
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: Color(_bluePrimaryValue),
      600: Color(0xFF1E88E5),
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1),
    },
  );
  static const int _bluePrimaryValue = 0xFF2196F3;

  static const themeColors = [orange, blue];

  static const Color color_999 = Color(0xff999999);
  static const Color color_84 = Color(0xff848484);

  static const Color color_333 = Color(0xff333333);
  static const Color color_28 = Color(0xFF282828);
  static const Color color_00 = Color(0xFF000000);
  static const Color color_9E = Color(0xFF9E9E9E);
  static const Color color_2C4068 = Color(0xFF2C4068);
  static const Color color_F0FCFF = Color(0xFFF0FCFF);
  static const Color color_C1 = Color(0xFFC1C1C1);
  static const Color color_FFF4F2 = Color(0xFFFFF4F2);
  static const Color color_FACEB8 = Color(0xFFFACEB8);
  static const Color color_FFEDE5 = Color(0xFFFFEDE5);
  static const Color color_FEC7AC = Color(0xFFFEC7AC);
  static const Color color_FFD26C = Color(0xFFFFD26C);

  static const Color color_DFE9FF = Color(0xFFDFE9FF);
  static const Color color_D1 = Color(0xFFD1D1D1);

  static const Color clear_color = Color(0x00ffffff);

  static const Color color_F2 = Color(0xFFF2F2F2);
  static const Color color_F5 = Color(0xFFF5F5F5);
  static const Color color_62 = Color(0xFF626262);
  static const Color color_49 = Color(0xFF494949);
  static const Color color_B9 = Color(0xFFb9b9b9);
  static const Color color_2f = Color(0xFF2f2f2f);

  static const Color color_white = Color(0xFFFFFFFF);
  static const Color color_E3 = Color(0xFFE3E3E3);

  static const Color app_opacity_white = Color.fromRGBO(255, 255, 255, 0.24);

  static const smallGrayB3Text = TextStyle(
    color: Colours.color_333,
  );
}

class ScreenWH {
  /// screen width 屏幕 宽
  static double get screenWidth =>  ScreenUtil().screenWidth;

  /// screen width 屏幕 高
  static double get screenHeight =>  ScreenUtil().screenHeight;



  /// appBar width 屏幕 宽
  static double get appBarHeight => flustars.ScreenUtil.getInstance().appBarHeight;


  /// screen density 屏幕 像素密度
  static double get screenDensity =>  ScreenUtil().pixelRatio;

  /// status bar height 状态栏高度
  static double get statusBarHeight => flustars.ScreenUtil.getInstance().statusBarHeight;

  /// bottom bar Height
  static double get bottomBarHeight => flustars.ScreenUtil.getInstance().bottomBarHeight;

  // 获取高度
  static double rsh(double value){
    return ScreenUtil().setHeight(value);
  }
  // 获取宽度
  static double rsw(double value){
    return ScreenUtil().setWidth(value);
  }
  // 字体
  static double rsSp(double value,{allowFontScalingSelf: true}){
    return ScreenUtil().setSp(value, allowFontScalingSelf: allowFontScalingSelf);
  }

}
