import 'dart:convert';

class TermsAndConditionsResponse {
  final bool status;
  final String message;
  final List<Term>? data;

  TermsAndConditionsResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory TermsAndConditionsResponse.fromJson(Map<String, dynamic> json) {
    return TermsAndConditionsResponse(
      status: json['Status'] as bool,
      message: json['message'] as String,
      data: json['data'] != null
          ? List<Term>.from(json['data'].map((x) => Term.fromJson(x)))
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

class Term {
  final String? id;
  final String? terms;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Term({
    this.id,
    this.terms,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Term.fromJson(Map<String, dynamic> json) {
    return Term(
      id: json['_id'] as String?,
      terms: json['Terms'] as String?,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      v: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'Terms': terms,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      '__v': v,
    };
  }
}
