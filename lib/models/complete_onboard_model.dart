import 'package:json_annotation/json_annotation.dart';

import 'generic_response_model.dart';
part 'complete_onboard_model.g.dart';

@JsonSerializable()
class CompleteOnboardModel {
  @JsonKey(name: "response")
  Response? response;
  @JsonKey(name: "data")
  Data? data;

  CompleteOnboardModel({
    this.response,
    this.data,
  });

  factory CompleteOnboardModel.fromJson(Map<String, dynamic> json) => _$CompleteOnboardModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompleteOnboardModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "user")
  User? user;
  @JsonKey(name: "tokens")
  Tokens? tokens;

  Data({
    this.user,
    this.tokens,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Tokens {
  @JsonKey(name: "accessToken")
  String? accessToken;
  @JsonKey(name: "refreshToken")
  String? refreshToken;
  @JsonKey(name: "accessExpiryTime")
  String? accessExpiryTime;
  @JsonKey(name: "refreshExpiryTime")
  String? refreshExpiryTime;

  Tokens({
    this.accessToken,
    this.refreshToken,
    this.accessExpiryTime,
    this.refreshExpiryTime,
  });

  factory Tokens.fromJson(Map<String, dynamic> json) => _$TokensFromJson(json);

  Map<String, dynamic> toJson() => _$TokensToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "fullName")
  String? fullName;
  @JsonKey(name: "isLoggedIn")
  bool? isLoggedIn;
  @JsonKey(name: "emailVerified")
  bool? emailVerified;
  @JsonKey(name: "socialLogin")
  bool? socialLogin;
  @JsonKey(name: "id")
  String? id;


  User({
    this.id,
    this.email,
    this.fullName,
    this.isLoggedIn,
    this.emailVerified,
    this.socialLogin
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

