// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) {
  return UserInfoModel(
      json['avatar'] as String,
      json['grade'] as String,
      json['id'] as String,
      json['idCardNo'] as String,
      json['major'] as String,
      json['name'] as String,
      json['nick'] as String,
      json['password'] as String,
      json['phone'] as String,
      json['qq'] as String,
      json['school'] as String,
      json['summary'] as String,
      json['wechat'] as String,
      json['orderCount'] as String,
      json['province'] as String,
      json['collectCount'] as String,
      json['discipline'] as String,
      json['errorCount'] as String,
      json['teacherPhone'] as String);
}

Map<String, dynamic> _$UserInfoModelToJson(UserInfoModel instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
      'grade': instance.grade,
      'id': instance.id,
      'idCardNo': instance.idCardNo,
      'major': instance.major,
      'name': instance.name,
      'nick': instance.nick,
      'password': instance.password,
      'phone': instance.phone,
      'qq': instance.qq,
      'school': instance.school,
      'summary': instance.summary,
      'wechat': instance.wechat,
      'orderCount': instance.orderCount,
      'province': instance.province,
      'collectCount': instance.collectCount,
      'discipline': instance.discipline,
      'errorCount': instance.errorCount,
      'teacherPhone': instance.teacherPhone
    };
