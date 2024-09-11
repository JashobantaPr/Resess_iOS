import 'package:json_annotation/json_annotation.dart';
part 'expert_input_model.g.dart';
@JsonSerializable()
class ExpertInputModel {
  @JsonKey(name: "subject")
  String? subject;
  @JsonKey(name: "profilePicture")
  String? profilePicture;
  @JsonKey(name: "spokenLanguages")
  List<String>? spokenLanguages;
  @JsonKey(name: "oneLineBio")
  String? oneLineBio;
  @JsonKey(name: "pricePerMinute")
  String? pricePerMinute;
  @JsonKey(name: "bio")
  String? bio;
  @JsonKey(name: "bioLink")
  String? bioLink;
  @JsonKey(name: "sessionTypes")
  List<String>? sessionTypes;
  @JsonKey(name: "documents")
  List<String>? documents;
  @JsonKey(name: "supportingUrls")
  List<String>? supportingUrls;
  @JsonKey(name: "paymentMethod")
  List<String>? paymentMethod;

  ExpertInputModel({
    this.subject,
    this.profilePicture,
    this.spokenLanguages,
    this.oneLineBio,
    this.pricePerMinute,
    this.bio,
    this.bioLink,
    this.sessionTypes,
    this.documents,
    this.supportingUrls,
    this.paymentMethod,
  });

  factory ExpertInputModel.fromJson(Map<String, dynamic> json) => _$ExpertInputModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExpertInputModelToJson(this);
}
