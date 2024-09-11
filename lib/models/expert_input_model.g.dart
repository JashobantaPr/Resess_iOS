// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expert_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpertInputModel _$ExpertInputModelFromJson(Map<String, dynamic> json) =>
    ExpertInputModel(
      subject: json['subject'] as String?,
      profilePicture: json['profilePicture'] as String?,
      spokenLanguages: (json['spokenLanguages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      oneLineBio: json['oneLineBio'] as String?,
      pricePerMinute: json['pricePerMinute'] as String?,
      bio: json['bio'] as String?,
      bioLink: json['bioLink'] as String?,
      sessionTypes: (json['sessionTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      documents: (json['documents'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      supportingUrls: (json['supportingUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      paymentMethod: (json['paymentMethod'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ExpertInputModelToJson(ExpertInputModel instance) =>
    <String, dynamic>{
      'subject': instance.subject,
      'profilePicture': instance.profilePicture,
      'spokenLanguages': instance.spokenLanguages,
      'oneLineBio': instance.oneLineBio,
      'pricePerMinute': instance.pricePerMinute,
      'bio': instance.bio,
      'bioLink': instance.bioLink,
      'sessionTypes': instance.sessionTypes,
      'documents': instance.documents,
      'supportingUrls': instance.supportingUrls,
      'paymentMethod': instance.paymentMethod,
    };
