class AppConfig {
  /// 测试0 上线1
  static const int SERVES_DEV = 1;
  static const String SERVER_ADDRESS = SERVES_DEV == 1
      ? "https://wap.huabote.net/client-api/"
      : "https://wap-test.huabote.net/client-api/";
  static const String WEB_ADDRESS = SERVES_DEV == 1
      ? "https://wap.huabote.net/"
      : "https://wap-test.huobote.net/";
  static const String LOGO_IMAGE = "https://res.huabote.net/app_logo.png";
  static const String IOS_APP_STORE =
      "https://itunes.apple.com/cn/app/%E8%AF%BE%E6%88%BF/id1535423580?mt=8";

  /// 缓存用户密码
  static const String KEY_SPLASH_PHONE = "KEY_SPLASH_PHONE";
  static const String KEY_SPLASH_PASSWORD = "KEY_SPLASH_PASSWORD";
  static const String KEY_SPLASH_LOGIN = "KEY_SPLASH_LOGIN";

  /// 科类
  static const String Discipline_key = "Discipline_key";
  static const String School_key = "School_key";
  static const String Major_key = "Major_key";

  /// 缓存的课件
  static const String CACHE_COURSE_KEY = "CACHE_COURSE_KEY";

  /// 客服电话
  static const String KEY_PHONE_CALL = '1831485113';

  /// 测试电话
  static const String KEY_PHONE_TEST = '15658815280';

  /// share SDK
  static const String WeChat_APPKey = "wx5ed5ea1777dec93b";
  static const String WeChat_AppSecret = "6cad58deeac62d57c645043b2eb05eac";

  static const String QQ_APPKey = '2642953421';
  static const String QQ_APPSecret = 'kf520520';

  /// 每页数量
  static const int PAGE_NUM = 10;
}

class Store{
  static dynamic widgetCtx;
  static String documentPath;
  static int deviceType; // 1 安卓  2 苹果

  /// 设置Widget上下文
  static setWidgetCtx(context){
    widgetCtx = context;
  }
  /// 设置文档存储路径
  static setDeviceType(int deviceType){
    deviceType = deviceType;
  }
}
