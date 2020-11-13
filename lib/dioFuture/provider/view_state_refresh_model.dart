import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:routerApp/dioFuture/provider/view_state_model.dart';

// 基于
abstract class ViewStateRefreshModel<T> extends ViewStateModel {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  RefreshController get refreshController => _refreshController;

  /// 下拉刷新
  ///
  /// [init] 是否是第一次加载
  /// true: Error时，需要跳转页面
  /// false: Error时，不需要跳转页面，直接给出提示
  Future<T> refresh({bool init = false}) async{
    try {
      var data = await loadData();
      onCompleted(data);
      refreshController.refreshCompleted();
      setIdle();
      return data;
    } catch(e, s){
      refreshController.refreshFailed();
      setError(e, s);
      return null;
    }
  }
  Future<T> loadData();
  onCompleted(T data){}
  @override
  void dispose(){
    _refreshController.dispose();
    super.dispose();
  }
}
