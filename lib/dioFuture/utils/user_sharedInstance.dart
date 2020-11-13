import 'package:routerApp/dioFuture/model/user/user_info_model.dart';
import 'package:routerApp/dioFuture/utils/sp_utils.dart';

enum UserType{
  UserTypeManager,
  UserTypeTeacher,
  UserTypeStudent,
  UserTypeOther,
}
class UserSharedInstance {
  // 单例公开访问点
  factory UserSharedInstance()=>_sharedInstance();

  // 静态私有成员，没有初始化
  static UserSharedInstance _instance;

  // 私有构造函数
  UserSharedInstance._(){
    // 具体初始化代码
  }


  static UserSharedInstance _sharedInstance(){
    if(_instance == null){
      _instance = UserSharedInstance._();
    }
    return _instance;
  }
  String username;
  UserInfoModel userInfoModel;
  String sessionId;
  String discipline;
  bool isFirstSchool = true;
  bool isFirst = false;
  bool isFirstPopModi = false;
  bool checkLogin(){
    if(userInfoModel !=null){
      return true;
    } else {
      return false;
    }
  }
  String getDiscipline(){
    if(discipline == null){
      return SpUtils.getDiscipline()??'';
    }
    return discipline;
  }
  static String convertBinarySystemFromDecimalSystem(int decimal, int index){
    int num = decimal;
    int remainder = 0;
    int divisor = 0;
    String prepare = "";
    while(true){
      remainder=num %2;
      double divisor1 = num/2;
      divisor = divisor1.toInt();
      num = divisor;
      prepare = '$remainder$prepare';
      if(divisor == 0){
        break;
      }
    }
    if(prepare.length == 1){
      prepare = "00$prepare";
    } else if(prepare.length == 2){
      prepare = '0$prepare';
    }
    String result = "0";
    if(index<prepare.length){
      result = prepare.substring(index, 1);
    }
    return result;
  }
  static String getKFSPUserId(String userId){
    return 'kfs$userId';
  }
}