import 'package:json_annotation/json_annotation.dart';

import 'complete_onboard_model.dart';
import 'generic_response_model.dart';
part 'email_signup_model.g.dart';
@JsonSerializable()
class EmailSignUpModel {
  @JsonKey(name: "response")
  Response? response;
  @JsonKey(name: "data")
  Data? data;

  EmailSignUpModel({
    this.response,
    this.data,
  });

  factory EmailSignUpModel.fromJson(Map<String, dynamic> json) => _$EmailSignUpModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmailSignUpModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "otp")
  int? otp;
  @JsonKey(name: "userExists")
  bool? userExist;


  Data({
    this.email,
    this.otp,
    this.userExist
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}


