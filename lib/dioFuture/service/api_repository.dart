import "package:routerApp/dioFuture/config/app_config.dart";
import 'package:routerApp/dioFuture/config/index.dart';
import 'package:routerApp/dioFuture/config/net/dw_http.dart';
import 'package:routerApp/dioFuture/service/api.dart';
import 'package:routerApp/dioFuture/model/user/user_info_model.dart';
class ApiRepository {
  static Future userInfo() async {
    var response = await http.get<Map>(Api.getUserInfo);
    return UserInfoModel.fromJson(response.data);
  }
  static Future login({String username, String password, String signCode, String type}) async{
    Map<String, dynamic> parameter = Map();
    if(Utils.isNotEmpty(signCode)){
      parameter["signcode"] = signCode;
    }
    if(Utils.isNotEmpty(type)){
      parameter["type"] = type;
    }
    if(Utils.isNotEmpty(username)){
      parameter["username"] = username;
    }
    if(Utils.isNotEmpty(password)){
      parameter["password"] = password;
    }
    var response = await http.post<Map>(Api.signIn, queryParameters: parameter);
    if(Utils.isEmpty(response.data)){
      return null;
    }
    return UserInfoModel.fromJson(response.data);
  }
}