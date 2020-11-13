import './view_state_model.dart';
/// 基于ViewStateModel
abstract class ViewStateListModel<T> extends ViewStateModel{
  /// 页面数据
  List<T> list =[];
  ///
  initData() async {
    setBusy();
    await refresh(init: true);
  }
  refresh({bool init = false}) async {
    try{
      List<T> data = await loadData();
      if(data.isEmpty){
        list.clear();
      } else {
        onCompleted(data);
        list.clear();
        list.addAll(data);
        setIdle();
      }
    } catch(e, s) {
      if(init) list.clear();
      setError(e, s);
    }
  }
  Future<List<T>> loadData();
  onCompleted(List<T> data){}
}