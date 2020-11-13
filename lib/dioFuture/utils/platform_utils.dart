import 'dart:io';
import 'dart:async';
import 'package:device_info/device_info.dart'; // 获取系统信息
import 'package:package_info/package_info.dart';  // 提供获取应用包信息的相关接口api
export 'dart:io';
// 判断是否是生产环境
const bool inProduction = const bool.fromEnvironment("dart.vm.product");

class PlatformUtils {
  static Future<PackageInfo> getAppPackageInfo(){
    return PackageInfo.fromPlatform();
  }
  static Future<String> getAppVersion() async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }
  static Future<String> getBuildNum() async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }
  static Future getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if(Platform.isAndroid){
      return await deviceInfo.androidInfo;
    } else if(Platform.isIOS){
      return await deviceInfo.iosInfo;
    } else {
      return null;
    }
  }
}