// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expert_output_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpertOutputModel _$ExpertOutputModelFromJson(Map<String, dynamic> json) =>
    ExpertOutputModel(
      response: json['response'] == null
          ? null
          : Response.fromJson(json['response'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExpertOutputModelToJson(ExpertOutputModel instance) =>
    <String, dynamic>{
      'response': instance.response,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      expert: json['expert'] == null
          ? null
          : Expert.fromJson(json['expert'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'expert': instance.expert,
    };

Expert _$ExpertFromJson(Map<String, dynamic> json) => Expert(
      userId: json['userId'] as String?,
      email: json['email'] as String?,
      fullName: json['fullName'] as String?,
      profilePicture: json['profilePicture'] as String?,
      profileHidden: json['profileHidden'] as bool?,
      sessionTypes: (json['sessionTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      bio: json['bio'] as String?,
      oneLineBio: json['oneLineBio'] as String?,
      bioLink: json['bioLink'] as String?,
      spokenLanguages: (json['spokenLanguages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      subject: json['subject'] as String?,
      documents: (json['documents'] as List<dynamic>?)
          ?.map((e) => Document.fromJson(e as Map<String, dynamic>))
          .toList(),
      supportingUrls: (json['supportingUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      paymentDetails: json['paymentDetails'] == null
          ? null
          : PaymentDetails.fromJson(
              json['paymentDetails'] as Map<String, dynamic>),
      status: json['status'] as String?,
      reviewStatus: json['reviewStatus'] as String?,
      isActive: json['isActive'] as bool?,
      pastPayouts: json['pastPayouts'] as List<dynamic>?,
      createdAt: json['createdAt'] as int?,
      updatedAt: json['updatedAt'] as int?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ExpertToJson(Expert instance) => <String, dynamic>{
      'userId': instance.userId,
      'email': instance.email,
      'fullName': instance.fullName,
      'profilePicture': instance.profilePicture,
      'profileHidden': instance.profileHidden,
      'sessionTypes': instance.sessionTypes,
      'bio': instance.bio,
      'oneLineBio': instance.oneLineBio,
      'bioLink': instance.bioLink,
      'spokenLanguages': instance.spokenLanguages,
      'subject': instance.subject,
      'documents': instance.documents,
      'supportingUrls': instance.supportingUrls,
      'paymentDetails': instance.paymentDetails,
      'status': instance.status,
      'reviewStatus': instance.reviewStatus,
      'isActive': instance.isActive,
      'pastPayouts': instance.pastPayouts,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'id': instance.id,
    };

Document _$DocumentFromJson(Map<String, dynamic> json) => Document(
      url: json['url'] as String?,
      verified: json['verified'] as bool?,
    );

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
      'url': instance.url,
      'verified': instance.verified,
    };

PaymentDetails _$PaymentDetailsFromJson(Map<String, dynamic> json) =>
    PaymentDetails(
      pricePerMinute: json['pricePerMinute'] as int?,
      currency: json['currency'] as String?,
      paymentMethod: (json['paymentMethod'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isSet: json['isSet'] as bool?,
    );

Map<String, dynamic> _$PaymentDetailsToJson(PaymentDetails instance) =>
    <String, dynamic>{
      'pricePerMinute': instance.pricePerMinute,
      'currency': instance.currency,
      'paymentMethod': instance.paymentMethod,
      'isSet': instance.isSet,
    };
