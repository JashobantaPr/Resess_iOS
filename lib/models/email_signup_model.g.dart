// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_signup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailSignUpModel _$EmailSignUpModelFromJson(Map<String, dynamic> json) =>
    EmailSignUpModel(
      response: json['response'] == null
          ? null
          : Response.fromJson(json['response'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmailSignUpModelToJson(EmailSignUpModel instance) =>
    <String, dynamic>{
      'response': instance.response,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      email: json['email'] as String?,
      otp: json['otp'] as int?,
      userExist: json['userExists'] as bool?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'email': instance.email,
      'otp': instance.otp,
      'userExists': instance.userExist,
    };
