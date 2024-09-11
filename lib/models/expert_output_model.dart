import 'package:json_annotation/json_annotation.dart';

import 'generic_response_model.dart';
part 'expert_output_model.g.dart';
@JsonSerializable()
class ExpertOutputModel {
  @JsonKey(name: "response")
  Response? response;
  @JsonKey(name: "data")
  Data? data;

  ExpertOutputModel({
    this.response,
    this.data,
  });

  factory ExpertOutputModel.fromJson(Map<String, dynamic> json) => _$ExpertOutputModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExpertOutputModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "expert")
  Expert? expert;

  Data({
    this.expert,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Expert {
  @JsonKey(name: "userId")
  String? userId;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "fullName")
  String? fullName;
  @JsonKey(name: "profilePicture")
  String? profilePicture;
  @JsonKey(name: "profileHidden")
  bool? profileHidden;
  @JsonKey(name: "sessionTypes")
  List<String>? sessionTypes;
  @JsonKey(name: "bio")
  String? bio;
  @JsonKey(name: "oneLineBio")
  String? oneLineBio;
  @JsonKey(name: "bioLink")
  String? bioLink;
  @JsonKey(name: "spokenLanguages")
  List<String>? spokenLanguages;
  @JsonKey(name: "subject")
  String? subject;
  @JsonKey(name: "documents")
  List<Document>? documents;
  @JsonKey(name: "supportingUrls")
  List<String>? supportingUrls;
  @JsonKey(name: "paymentDetails")
  PaymentDetails? paymentDetails;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "reviewStatus")
  String? reviewStatus;
  @JsonKey(name: "isActive")
  bool? isActive;
  @JsonKey(name: "pastPayouts")
  List<dynamic>? pastPayouts;
  @JsonKey(name: "createdAt")
  int? createdAt;
  @JsonKey(name: "updatedAt")
  int? updatedAt;
  @JsonKey(name: "id")
  String? id;

  Expert({
    this.userId,
    this.email,
    this.fullName,
    this.profilePicture,
    this.profileHidden,
    this.sessionTypes,
    this.bio,
    this.oneLineBio,
    this.bioLink,
    this.spokenLanguages,
    this.subject,
    this.documents,
    this.supportingUrls,
    this.paymentDetails,
    this.status,
    this.reviewStatus,
    this.isActive,
    this.pastPayouts,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  factory Expert.fromJson(Map<String, dynamic> json) => _$ExpertFromJson(json);

  Map<String, dynamic> toJson() => _$ExpertToJson(this);
}

@JsonSerializable()
class Document {
  @JsonKey(name: "url")
  String? url;
  @JsonKey(name: "verified")
  bool? verified;

  Document({
    this.url,
    this.verified,
  });

  factory Document.fromJson(Map<String, dynamic> json) => _$DocumentFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentToJson(this);
}

@JsonSerializable()
class PaymentDetails {
  @JsonKey(name: "pricePerMinute")
  int? pricePerMinute;
  @JsonKey(name: "currency")
  String? currency;
  @JsonKey(name: "paymentMethod")
  List<String>? paymentMethod;
  @JsonKey(name: "isSet")
  bool? isSet;

  PaymentDetails({
    this.pricePerMinute,
    this.currency,
    this.paymentMethod,
    this.isSet,
  });

  factory PaymentDetails.fromJson(Map<String, dynamic> json) => _$PaymentDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentDetailsToJson(this);
}

