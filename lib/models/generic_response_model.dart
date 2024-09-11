import 'package:json_annotation/json_annotation.dart';
part 'generic_response_model.g.dart';
@JsonSerializable()
class ResponseModel {
  @JsonKey(name: "response")
  Response? response;

  ResponseModel({
    this.response,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) => _$ResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);
}

@JsonSerializable()
class Response {
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "responseCode")
  int? responseCode;
  @JsonKey(name: "message")
  String? message;

  Response({
    this.status,
    this.responseCode,
    this.message,
  });

  factory Response.fromJson(Map<String, dynamic> json) => _$ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}