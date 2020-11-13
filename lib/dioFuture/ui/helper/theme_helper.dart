import 'package:flutter/material.dart';
import 'package:routerApp/dioFuture/config/index.dart';

class ThemeHelper {
  static InputDecorationTheme inputDecorationTheme(ThemeData theme) {
    /// var primaryColor = theme.primaryColor;
    /// var dividerColor = theme.dividerColor;
    /// var errorColor = theme.errorColor;
    /// var disabledColor = theme.disabledColor;
    var primaryColor = theme.accentColor;
    var dividerColor = theme.accentColor;
    var errorColor = theme.accentColor;
    var disabledColor = theme.accentColor;
    var width = 0.0;

    // InputDecorationTheme类型，InputDecorator, TextField和TextFormField的默认InputDecoration值就是基于此主题

    return InputDecorationTheme(
      labelStyle: TextStyle(fontSize: 14, color: Colours.color_white),
      hintStyle: TextStyle(fontSize: 14, color: Colours.color_9E),
      errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: width, color: errorColor)),
      focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 0.0, color: errorColor)),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: width, color: primaryColor)),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: width, color: dividerColor)),
      border: UnderlineInputBorder(
          borderSide: BorderSide(width: width, color: dividerColor)),
      disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: width, color: disabledColor)),
    );
  }
}
