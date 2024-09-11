import 'dart:convert';

class PrivacyResponse {
  final bool status;
  final String message;
  final List<Privacy>? data;

  PrivacyResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory PrivacyResponse.fromJson(Map<String, dynamic> json) {
    return PrivacyResponse(
      status: json['Status'] as bool,
      message: json['message'] as String,
      data: json['data'] != null
          ? List<Privacy>.from(json['data'].map((x) => Privacy.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Status': status,
      'message': message,
      'data': data != null ? List<dynamic>.from(data!.map((x) => x.toJson())) : null,
    };
  }
}

class Privacy {
  final String? id;
  final String? terms;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Privacy({
    this.id,
    this.terms,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Privacy.fromJson(Map<String, dynamic> json) {
    return Privacy(
      id: json['_id'] as String?,
      terms: json['Privacy'] as String?,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      v: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'Privacy': terms,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      '__v': v,
    };
  }
}
