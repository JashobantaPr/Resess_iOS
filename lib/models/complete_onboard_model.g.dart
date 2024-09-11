// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_onboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompleteOnboardModel _$CompleteOnboardModelFromJson(
        Map<String, dynamic> json) =>
    CompleteOnboardModel(
      response: json['response'] == null
          ? null
          : Response.fromJson(json['response'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CompleteOnboardModelToJson(
        CompleteOnboardModel instance) =>
    <String, dynamic>{
      'response': instance.response,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      tokens: json['tokens'] == null
          ? null
          : Tokens.fromJson(json['tokens'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'user': instance.user,
      'tokens': instance.tokens,
    };

Tokens _$TokensFromJson(Map<String, dynamic> json) => Tokens(
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      accessExpiryTime: json['accessExpiryTime'] as String?,
      refreshExpiryTime: json['refreshExpiryTime'] as String?,
    );

Map<String, dynamic> _$TokensToJson(Tokens instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'accessExpiryTime': instance.accessExpiryTime,
      'refreshExpiryTime': instance.refreshExpiryTime,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      email: json['email'] as String?,
      fullName: json['fullName'] as String?,
      isLoggedIn: json['isLoggedIn'] as bool?,
      emailVerified: json['emailVerified'] as bool?,
      socialLogin: json['socialLogin'] as bool?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'email': instance.email,
      'fullName': instance.fullName,
      'isLoggedIn': instance.isLoggedIn,
      'emailVerified': instance.emailVerified,
      'socialLogin': instance.socialLogin,
      'id': instance.id,
    };
