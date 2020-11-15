import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/foundation.dart';
import 'package:routerApp/dioFuture/config/app_config.dart';
import 'package:routerApp/dioFuture/utils/user_sharedInstance.dart';
import 'api.dart';
import '../storage_manager.dart';

final Http http = Http();

class Http extends BaseHttp {
  @override
  void init() {
    options.baseUrl = AppConfig.SERVER_ADDRESS;
    interceptors
      ..add(ApiInterceptor())
      ..add(CookieManager(
          PersistCookieJar(dir: StorageManager.temporaryDirectory.path)));
  }
}

class ApiInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    debugPrint('---api-request--->url--> ${options.baseUrl}${options.path}' +
        ' queryParameters: ${options.queryParameters}');
    return options;
  }
  @override
  onResponse(Response response){
    debugPrint('---api-response--->resp----->${response.data}');
    ResponseData respData = ResponseData.fromJson(response.data);
    LogUtil.e(response);
    LogUtil.e(respData);
    if(response.headers['set-cookie']!=null){
      String cookieStr = response.headers['set-cookie'].first;
      List<String> cookies = cookieStr.split(";");
      List<String> cookies11 = cookies.first.split("=");
      if(cookies11.length>1){
        print('sasasasasasasas  ${cookies11[1]}');
        UserSharedInstance().sessionId=cookies11[1];
      }
    }
    if(respData.success){
      response.data = respData.data;
      return http.resolve(response);
    } else {
      if(respData.code == -1001){
        throw const UnAuthorizedException();
      } else{
        throw NotSuccessException.fromRespData(respData);
      }
    }
  }
}

class ResponseData extends BaseResponseData {
  bool get success => 0 == code;
  ResponseData.fromJson(Map<String, dynamic> json){
    code = json["code"];
    message = json['message'];
    data = json['data'];
  }
}
class ResponseListData<T>{
  String pageSize;
  String pageNum;
  String total;
  List<T> pageList;
  ResponseListData.fromJson(Map<String, dynamic> json):
        pageSize=json['pageSize'],
        pageList=json['pageList'],
        pageNum=json['pageNum'],
        total=json['total'];
}

