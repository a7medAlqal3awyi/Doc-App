// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) =>
    SignupResponse(
      message: json['message'] as String?,
      signupData: json['data'] == null
          ? null
          : SignupData.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as bool?,
      code: json['code'] as int?,
    );

Map<String, dynamic> _$SignupResponseToJson(SignupResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.signupData,
      'status': instance.status,
      'code': instance.code,
    };

SignupData _$SignupDataFromJson(Map<String, dynamic> json) => SignupData(
      token: json['token'] as String?,
      userName: json['userName'] as String?,
    );

Map<String, dynamic> _$SignupDataToJson(SignupData instance) =>
    <String, dynamic>{
      'token': instance.token,
      'userName': instance.userName,
    };
