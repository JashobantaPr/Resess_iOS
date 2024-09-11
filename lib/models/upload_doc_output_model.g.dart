// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_doc_output_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadDocOutputModel _$UploadDocOutputModelFromJson(
        Map<String, dynamic> json) =>
    UploadDocOutputModel(
      response: json['response'] == null
          ? null
          : Response.fromJson(json['response'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UploadDocOutputModelToJson(
        UploadDocOutputModel instance) =>
    <String, dynamic>{
      'response': instance.response,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      endpoint: json['endpoint'] as String?,
      documents: (json['documents'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'endpoint': instance.endpoint,
      'documents': instance.documents,
    };
