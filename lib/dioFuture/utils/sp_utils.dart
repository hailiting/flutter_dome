import 'package:flustars/flustars.dart';
import 'package:routerApp/dioFuture/config/app_config.dart';

class SpUtils {
  static void putObject<T>(String key, Object value){
    switch(T){
      case int:
        SpUtil.putInt(key, value);
        break;
      case double:
        SpUtil.putDouble(key, value);
        break;
      case bool:
        SpUtil.putBool(key, value);
        break;
      case String:
        SpUtil.putString(key, value);
        break;
      case List:
        SpUtil.putStringList(key, value);
        break;
      default:
        SpUtil.putObject(key, value);
        break;
    }
  }
  static savePhonePassword(String phone, String password){
    SpUtils.putObject(AppConfig.KEY_SPLASH_LOGIN, {
      AppConfig.KEY_SPLASH_PHONE: phone,
      AppConfig.KEY_SPLASH_PASSWORD: password,
    });
  }
  static clearPhonePassword(){
    SpUtil.remove(AppConfig.KEY_SPLASH_LOGIN);
  }
  static Map getPhonePassword(){
    Map map = SpUtil.getObject(AppConfig.KEY_SPLASH_LOGIN);
    return map??null;
  }
  static String getDiscipline(){
    String discipline=SpUtil.getString(AppConfig.Discipline_key);
    return discipline ?? null;
  }
}