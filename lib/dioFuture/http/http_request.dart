import "package:dio/dio.dart";
import 'package:cookie_jar/cookie_jar.dart';


const String BASEURL = "https://xxx.com";

class HTTPConfig{
  static const baseURL = BASEURL;
  static const timeout = 1000;
}

class HttpRequest {
  static final BaseOptions options = BaseOptions(
      baseUrl: HTTPConfig.baseURL,
      connectTimeout: HTTPConfig.timeout
  );
  static final Dio dio = Dio(options);
  static Future<T> request<T>(String url,
      {
        String method="get",
        Map<String, dynamic> params,
        Interceptor inter
      }) async {
    // 1. 请求的单独配置 header设置
    Map<String, dynamic> _header = new Map();
    _header["Lang"] = "zh_cn";
    _header["Coin"] = "CNY";
    _header["Token"]= "zzzzzz";

    final options = Options(
      method: method,
      headers: _header,
    );
    // 2. 添加第一个拦截器
    Interceptor dInter = InterceptorsWrapper(
        onRequest: (RequestOptions options){
          // 2.1 在进行任何网络请求时，添加一个leading提示
          // 2.2 在这判断是否有Token
          // 2.3 对参数进行一些处理，比如序列化等
          print("拦截请求");
          return options;
        },
        onResponse: (Response response){
          print("拦截响应");
          return response;
        },
        onError: (DioError error){
          print("拦截了错误");
          return error;
        }
    );
    List<Interceptor> inters = [dInter];
    if(inter != null){
      inters.add(inter);
    }
    dio.interceptors.addAll(inters);
    // 3. 发送网络请求
    try {
      Response response = await dio.request<T>(
          url,
          queryParameters: params,
          options: options
      );
      return response.data;
    } on DioError catch(e){
      return Future.error(e);
    }
  }
}
