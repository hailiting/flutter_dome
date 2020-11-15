import 'package:flutter/cupertino.dart';
import 'package:routerApp/dioFuture/config/storage_manager.dart';
import 'package:routerApp/dioFuture/model/user.dart';
import 'package:routerApp/dioFuture/model/user/user_info_model.dart';
import 'package:routerApp/dioFuture/provider/view_state_refresh_model.dart';
import 'package:routerApp/dioFuture/provider/view_state_refresh_list_model.dart';
import 'package:routerApp/dioFuture/service/api_repository.dart';
import 'package:routerApp/dioFuture/utils/sp_utils.dart';
import 'package:routerApp/dioFuture/utils/user_sharedInstance.dart';

class UserModel extends ViewStateRefreshModel{
  static  const String kUser = "kUser";
  UserInfoModel _user;
  UserInfoModel get user => _user;
  bool get hasUser => user!=null;
  UserModel();
  Future<bool> userInfo() async {
    try{
      var user = await ApiRepository.userInfo();
      refreshController.refreshCompleted();
      saveUser(user);
      return true;
    } catch(e, s){
      refreshController.refreshFailed();
      return false;
    }
  }
  saveUser(UserInfoModel user){
    _user = user;
    UserSharedInstance().userInfoModel = user;
    UserSharedInstance().discipline = user.discipline;
    notifyListeners();
    StorageManager.localStorage.setItem(kUser, user);
  }
  clearUser(){
    _user= null;
    UserSharedInstance().userInfoModel = null;
    UserSharedInstance().discipline = null;
    SpUtils.clearPhonePassword();
    notifyListeners();
    StorageManager.localStorage.deleteItem(kUser);
  }
  @override
  Future<bool> loadData({int pageNum}) async {
    return await this.userInfo();
  }
  @override
  onCompleted(data) {
  }
 }