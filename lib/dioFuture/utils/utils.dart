import 'dart:convert';
import 'dart:math';
import 'dart:io';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info/package_info.dart';

class Utils {
  /// MD5
  static String generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }

  static bool verificationPassword(String data) {
    if (data.length > 5) {
      return true;
    } else {
      return false;
    }
  }

  static bool verificationPhone(String data) {
    return RegexUtil.isMobileSimple(data);
  }

  static bool verificationCode(String data) {
    if (data.length == 6) {
      return true;
    } else {
      return false;
    }
  }

  static String getTimeTypeYearMonthDay(int ms) {
    if (ms == null) {
      return "";
    }
    return DateUtil.formatDateMs(ms, format: "yyyy/MM/dd HH:mm:ss");
  }

  static String getTimeTypeMonthDay(int ms) {
    if (ms == null) {
      return "";
    }
    return DateUtil.formatDateMs(ms, format: "MM.dd");
  }

  static String getNewsTimeTypeMonthDay(int ms) {
    if (ms == null) {
      return "";
    }
    if (DateUtil.isToday(ms)) {
      return DateUtil.formatDateMs(ms, format: "HH:mm");
    }
    return DateUtil.formatDateMs(ms, format: "MM.dd");
  }

  static String getTimeTypeYearMonthDayHM(int dateStr) {
    if (dateStr == null) {
      return '';
    }
    return DateUtil.formatDateMs(dateStr, format: DateFormats.y_mo_d_h_m);
  }

  static String getTimeLine(int dateStr) {
    if (dateStr == null) {
      return "";
    }
    var now = new DateTime.now().millisecondsSinceEpoch;
    return TimelineUtil.format(dateStr, locTimeMs: now, locale: "zh");
  }

  static Future<File> getCacheFile(String path) async {
    var directory = await getApplicationDocumentsDirectory();
    String filePath = directory.path + "/" + path;
    File file = new File('$filePath');
    return file;
  }

  static bool isEmptyNull(Object value) {
    if (value == null || value == "null") {
      return true;
    }
    return false;
  }

  static bool isEmptyList(List list) {
    return ObjectUtil.isEmptyList(list);
  }

  static bool isEmpty(Object object) {
    return ObjectUtil.isEmpty(object);
  }

  static bool isNotEmpty(Object object) {
    return ObjectUtil.isNotEmpty(object);
  }

  static bool twoListIsEqual(List listA, List listB) {
    return ObjectUtil.twoListIsEqual(listA, listB);
  }

  static int getLength(Object value) {
    return ObjectUtil.getLength(value);
  }

  static String getVideoTime(int value) {
    num m = value / 60;
    int s = value % 60;
    if (s < 10) {
      return '${m.toInt()}:0$s';
    }
    return '${m.toInt()}:$s';
  }

  static String getLastTime(int value) {
    num m = value / 60;
    int s = value % 60;
    if (s < 10) {
      return '${m.toInt()}分:0$s秒';
    }
    return '${m.toInt()}分:0$s秒';
  }

  static String getStringRemoveHtml(String html) {
    RegExp exp = new RegExp(r"<\/?.+?\/?>");
    String str = html.replaceAll(exp, "");
    print(str);
    return str;
  }

  static const List<String> weekdays = const [
    "Sun",
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat"
  ];

  /// 给定月份中的天数列表
  static List<DateTime> daysInMonth(DateTime month) {
    var first = firstDayOfMonth(month);
    var daysBefore = first.weekday;
    var firstToDisplay = first.subtract(new Duration(days: daysBefore));
    var last = Utils.lastDayOfMonth(month);

    var daysAfter = 7 - last.weekday;
    if (daysAfter == 0) {
      daysAfter = 7;
    }
    var lastToDisplay = last.add(new Duration(days: daysAfter));
    return daysInRange(firstToDisplay, lastToDisplay).toList();
  }

  static DateTime firstDayOfMonth(DateTime month) {
    return new DateTime(month.year, month.month);
  }

  static DateTime lastDayOfMonth(DateTime month) {
    var beginningNextMonth = (month.month < 12)
        ? new DateTime(month.year, month.month + 1, 1)
        : new DateTime(month.year + 1, 1, 1);
    return beginningNextMonth.subtract(new Duration(days: 1));
  }

  /// 返回给定范围内每天的[DateTime]。
  static Iterable<DateTime> daysInRange(DateTime start, DateTime end) sync* {
    var i = start;
    var offset = start.timeZoneOffset;
    while (i.isBefore(end)) {
      yield i;
      i = i.add(new Duration(days: 1));
      var timeZoneDiff = i.timeZoneOffset - offset;
      if (timeZoneDiff.inSeconds != 0) {
        offset = i.timeZoneOffset;
        i = i.subtract(new Duration(seconds: timeZoneDiff.inSeconds));
      }
    }
  }

  static bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  static bool isSameWeek(DateTime a, DateTime b) {
    a = new DateTime.utc(a.year, a.month, a.day);
    b = new DateTime.utc(b.year, b.month, b.day);
    var diff = a.toUtc().difference(b.toUtc()).inDays;
    if (diff.abs() >= 7) {
      return false;
    }
    var min = a.isBefore(b) ? a : b;
    var max = a.isBefore(b) ? b : a;
    var result = max.weekday % 7 - min.weekday % 7 >= 0;
    return true;
  }

  static DateTime previousMonth(DateTime m) {
    var year = m.year;
    var month = m.month;
    if (month == 1) {
      year--;
      month = 12;
    } else {
      month--;
    }
    return new DateTime(year, month);
  }

  static DateTime nextMonth(DateTime m) {
    var year = m.year;
    var month = m.month;
    if (month == 12) {
      year++;
      month = 1;
    } else {
      month++;
    }
    return new DateTime(year, month);
  }

  static DateTime previousWeek(DateTime w) {
    return w.subtract(new Duration(days: 7));
  }

  static DateTime nextWeek(DateTime w) {
    return w.add(new Duration(days: 7));
  }

  static String randStr() {
    String alphabet = "1234567890";
    int strLength = 15; // 生成的字符串固定长度
    String left = "";
    for (var i = 0; i < strLength; i++) {
      left = left + alphabet[Random().nextInt(alphabet.length)];
    }
    return left;
  }

  // 拨打电话
  static callPhone(String phone) async {
    String url = 'tel:$phone';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      LogUtil.e("Could not launch $url");
    }
  }

  static callUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      LogUtil.e("Could not launch $url");
    }
  }

  /// 检查版本
  static Future<bool> checkVersion(int version) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String appVersion = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    print('$appName, $packageName, $appVersion, $buildNumber');
    if (int.parse(buildNumber) < version) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  // 获取相机权限
  static Future<bool> getCameraPermission() async {
    PermissionStatus permission =
        await PermissionHandler().checkPermissionStatus(PermissionGroup.camera);
    await PermissionHandler().checkPermissionStatus(PermissionGroup.camera);
    if (permission == PermissionStatus.denied) {
      // 用户拒绝了相机
      Map<PermissionGroup, PermissionStatus> permissions =
          await PermissionHandler()
              .requestPermissions([PermissionGroup.camera]);
      PermissionStatus state = permissions[PermissionGroup.camera];
      print("permission $permission");
      if (state == PermissionStatus.granted) {
        return Future.value(true);
      } else {
        // 去授权
        return Future.value(false);
      }
    } else if (permission == PermissionStatus.disabled) {
      // 此设备不支持
      return Future.value(false);
    } else if (permission == PermissionStatus.granted) {
      // 此设备已授权
      return Future.value(true);
    } else {
      // 未知错误
      Map<PermissionGroup, PermissionStatus> permissions =
          await PermissionHandler()
              .requestPermissions([PermissionGroup.camera]);
      PermissionStatus state = permissions[PermissionGroup.camera];
      print("permission $permission");
      if (state == PermissionStatus.granted) {
        return Future.value(true);
      } else {
        // 去授权
        return Future.value(false);
      }
    }
  }

  /// 获取批次
  ///
  //      获取学生批次
  //      type: 1 成教，2 远程，3 所有
  //      all: true 所有，false 当前年往后推两年
  //      order: desc 降序，asc 升序
  //      备注：远程 03 09， 成教 03
  static List studentBatch({type = 3, all = true, order = "desc"}) {
    List model_1 = ["03"];
    List model_2 = ["03", "09"];
    List yearList = [];
    List dateList = [];
    var nowYear = new DateTime.now().year;
    var start = all ? 2018 : nowYear;
    var end = nowYear + 2;
    for (var i = start; i <= end; i++) {
      yearList.add(i);
    }
    if ([1, 3].indexOf(type) > -1) {
      model_1.forEach((item) {
        yearList.forEach((item2) {
          dateList.add("$item2" + "$item");
        });
      });
    }
    if ([2, 3].indexOf(type) > -1) {
      model_2.forEach((item) {
        yearList.forEach((item2) {
          dateList.add("$item2" + "$item");
        });
      });
    }
    List list = [];
    dateList.forEach((item) {
      if (list.indexOf(item) == -1) list.add(item);
    });
    // 排序
    list.sort((a, b) => (order == "asc" ? a - b : b - a));
    return yearList;
  }
}
