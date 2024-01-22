import 'package:freezed_annotation/freezed_annotation.dart';
part 'signup_response.g.dart';
@JsonSerializable()
class SignupResponse {
  final String? message;
  @JsonKey(name: 'data')
  final SignupData? signupData;
  final bool? status;
  final int? code;

  SignupResponse({
    this.message,
    this.signupData,
    this.status,
    this.code,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
}

@JsonSerializable()
class SignupData {
  final String? token;
  final String? userName;

  SignupData({
    this.token,
    this.userName,
  });

  factory SignupData.fromJson(Map<String, dynamic> json) =>
      _$SignupDataFromJson(json); // SignupData.
}
