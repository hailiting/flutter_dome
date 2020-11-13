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
}