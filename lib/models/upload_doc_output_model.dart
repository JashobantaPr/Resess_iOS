import 'package:json_annotation/json_annotation.dart';

import 'generic_response_model.dart';

part 'upload_doc_output_model.g.dart';
@JsonSerializable()
class UploadDocOutputModel {
  @JsonKey(name: "response")
  Response? response;
  @JsonKey(name: "data")
  Data? data;

  UploadDocOutputModel({
    this.response,
    this.data,
  });

  factory UploadDocOutputModel.fromJson(Map<String, dynamic> json) => _$UploadDocOutputModelFromJson(json);

  Map<String, dynamic> toJson() => _$UploadDocOutputModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "endpoint")
  String? endpoint;
  @JsonKey(name: "documents")
  List<String>? documents;

  Data({
    this.endpoint,
    this.documents,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

