import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HttpDomePage extends StatefulWidget {
  @override
  _HttpDomePageState createState() => _HttpDomePageState();
}

class _HttpDomePageState extends State<HttpDomePage> {
  String showResult = "";
  // 网络请求的方法，返回的具体类容就是Fund类型
  Future<FetchAllowIndexModal> fetchPost() async {
    final response = await http
        .get("https://www.ibear.info/api/v2/contract/query/allow_index");
    final result = json.decode(response.body);
    return FetchAllowIndexModal.fromJson(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Http dome"),
          leading: BackButton(),
        ),
        body: Column(
          children: [
            InkWell(
              onTap: () {
                fetchPost().then((FetchAllowIndexModal value) {
                  print(value);
                  setState(() {
                    showResult =
                        "请求结果："
                            "indexName: ${value.data[0].indexName} "
                            "indexType: ${value.data[0].indexType} "
                            "klinePrecision: ${value.data[0].klinePrecision} "
                            "showPrecision: ${value.data[0].showPrecision} "
                            "code: ${value.code}";
                  });
                });
              },
              child: RaisedButton(
                child: Text(
                  "点我",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Text(
              showResult,
              style: TextStyle(color: Colors.black, fontSize: 24),
              textAlign: TextAlign.center,
            )
          ],
        ));
  }
}

// 定义一个工厂类
class FetchAllowIndexModal {
  int code;
  String msg;
  bool success;
  List<FetchAllowIndexModalItem> data;
  FetchAllowIndexModal({this.code, this.msg, this.success, this.data});
  FetchAllowIndexModal.fromJson(Map<String, dynamic> json) {
    this.code = json["code"];
    this.msg = json["msg"];
    this.success = json["success"];
    this.data = (json["data"] as List) != null
        ? (json['data'] as List)
            .map((i) => FetchAllowIndexModalItem.fromJson(i))
            .toList()
        : null;
  }
}

class FetchAllowIndexModalItem {
  String indexName;
  int indexType;
  String klinePrecision;
  String showPrecision;
  FetchAllowIndexModalItem(
      {this.indexName,
      this.indexType,
      this.klinePrecision,
      this.showPrecision});
  FetchAllowIndexModalItem.fromJson(Map<String, dynamic> json) {
    indexName = json["index_name"];
    indexType = json["index_type"];
    klinePrecision = json["kline_precision"];
    showPrecision = json["show_precision"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["indexName"] = this.indexName;
    data["indexType"] = this.indexType;
    return data;
  }
}
