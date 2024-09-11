class UserProfileResponse {
  final bool status;
  final String message;
  final Data? data;

  UserProfileResponse({required this.status, required this.message, this.data});

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) {
    return UserProfileResponse(
      status: json['Status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }
}

class Data {
  final Profile? profile;

  Data({this.profile});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      profile: json['profile'] != null ? Profile.fromJson(json['profile']) : null,
    );
  }
}

class Profile {
  final String id;
  final String name;
  final String password;
  final String email;
  final String token;
  final String emailotp;
  final bool otpVerified;
  final bool forgetOtpVerified;
  final bool profile;
  final bool adminApprove;
  final bool adminBlock;
  final String createdAt;
  final String updatedAt;
  final int v;

  Profile({
    required this.id,
    required this.name,
    required this.password,
    required this.email,
    required this.token,
    required this.emailotp,
    required this.otpVerified,
    required this.forgetOtpVerified,
    required this.profile,
    required this.adminApprove,
    required this.adminBlock,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      password: json['password'] ?? '',
      email: json['email'] ?? '',
      token: json['token'] ?? '',
      emailotp: json['emailotp'] ?? '',
      otpVerified: json['otpVerified'] ?? false,
      forgetOtpVerified: json['forgetOtpVerified'] ?? false,
      profile: json['profile'] ?? false,
      adminApprove: json['adminApprove'] ?? false,
      adminBlock: json['adminBlock'] ?? false,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
    );
  }
}
