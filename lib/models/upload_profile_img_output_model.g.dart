// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_profile_img_output_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadProfileImgOutputModel _$UploadProfileImgOutputModelFromJson(
        Map<String, dynamic> json) =>
    UploadProfileImgOutputModel(
      response: json['response'] == null
          ? null
          : Response.fromJson(json['response'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UploadProfileImgOutputModelToJson(
        UploadProfileImgOutputModel instance) =>
    <String, dynamic>{
      'response': instance.response,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      endpoint: json['endpoint'] as String?,
      imagePath: json['imagePath'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'endpoint': instance.endpoint,
      'imagePath': instance.imagePath,
    };
