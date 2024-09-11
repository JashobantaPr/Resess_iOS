import 'package:json_annotation/json_annotation.dart';

import 'generic_response_model.dart';

part 'upload_profile_img_output_model.g.dart';
@JsonSerializable()
class UploadProfileImgOutputModel {
  @JsonKey(name: "response")
  Response? response;
  @JsonKey(name: "data")
  Data? data;

  UploadProfileImgOutputModel({
    this.response,
    this.data,
  });

  factory UploadProfileImgOutputModel.fromJson(Map<String, dynamic> json) => _$UploadProfileImgOutputModelFromJson(json);

  Map<String, dynamic> toJson() => _$UploadProfileImgOutputModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "endpoint")
  String? endpoint;
  @JsonKey(name: "imagePath")
  String? imagePath;

  Data({
    this.endpoint,
    this.imagePath,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

