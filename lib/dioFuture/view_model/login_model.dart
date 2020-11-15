import 'package:routerApp/dioFuture/config/index.dart';
import 'package:routerApp/dioFuture/config/storage_manager.dart';
import 'package:routerApp/dioFuture/provider/view_state_model.dart';
import 'package:routerApp/dioFuture/service/api_repository.dart';
import 'package:routerApp/dioFuture/utils/sp_utils.dart';
import 'package:routerApp/dioFuture/utils/user_sharedInstance.dart';

import './user_model.dart';

const String kLoginName = "kLoginName";

class LoginModel extends ViewStateModel{
  final UserModel userModel;
  LoginModel(this.userModel):assert(userModel!=null);
  String getLoginName(){
    return StorageManager.sharedPreferences.getString(kLoginName);
  }
  Future<bool> login({loginName, password, String signCode, String type}) async{
    setBusy();
    try{
      var user = await ApiRepository.login(username: loginName,password:password,signCode:signCode, type:type);
      if(Utils.isNotEmpty(user)){
        userModel.saveUser(user);
        SpUtils.savePhonePassword(userModel.user.phone, userModel.user.password);
        StorageManager.sharedPreferences.setString(kLoginName, userModel.user.phone);
      }
      setIdle();
      return true;
    }  catch (e, s){
      userModel.clearUser();
      setError(e, s);
      return false;
    }
  }
}