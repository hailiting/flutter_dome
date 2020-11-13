import 'package:json_annotation/json_annotation.dart';
part 'user_info_model.g.dart';
@JsonSerializable(nullable: false)
class UserInfoModel extends Object {
  @JsonKey(name: "avatar")
  String avatar;
  @JsonKey(name: "grade")
  String grade;
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "idCardNo")
  String idCardNo;
  @JsonKey(name: "major")
  String major;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "nick")
  String nick;
  @JsonKey(name: "password")
  String password;
  @JsonKey(name: "phone")
  String phone;
  @JsonKey(name: "qq")
  String qq;

  @JsonKey(name: "school")
  String school;
  @JsonKey(name: "summary")
  String summary;
  @JsonKey(name: "wechat")
  String wechat;

  @JsonKey(name: "orderCount")
  String orderCount;
  @JsonKey(name: "province")
  String province;
  @JsonKey(name: "collectCount")
  String collectCount;

  @JsonKey(name: "discipline")
  String discipline;

  @JsonKey(name: "errorCount")
  String errorCount;

  @JsonKey(name: "teacherPhone")
  String teacherPhone;

  UserInfoModel(
      this.avatar,
      this.grade,
      this.id,
      this.idCardNo,
      this.major,
      this.name,
      this.nick,
      this.password,
      this.phone,
      this.qq,
      this.school,
      this.summary,
      this.wechat,
      this.orderCount,
      this.province,
      this.collectCount,
      this.discipline,
      this.errorCount,
      this.teacherPhone);
  factory UserInfoModel.fromJson(Map<String, dynamic> srcJson) =>
      _$UserInfoModelFromJson(srcJson);
  Map<String, dynamic> toJson() => _$UserInfoModelToJson(this);
}
