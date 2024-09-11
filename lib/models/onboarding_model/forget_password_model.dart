

class forgetData {
  String? sId;
  String? name;
  String? email;
  String? emailotp;
  bool? otpVerified;
  bool? profile;
  bool? adminApprove;
  bool? adminBlock;
  String? createdAt;
  String? updatedAt;
  String? agoraToken;
  Tokens? tokens;

  forgetData(
      {this.sId,
      this.name,
      this.email,
      this.emailotp,
      this.otpVerified,
      this.profile,
      this.adminApprove,
      this.adminBlock,
      this.createdAt,
      this.updatedAt,
      this.agoraToken,
      this.tokens});

  forgetData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    emailotp = json['emailotp'];
    otpVerified = json['otpVerified'];
    profile = json['profile'];
    adminApprove = json['adminApprove'];
    adminBlock = json['adminBlock'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    agoraToken = json['agoraToken'];
    tokens =
        json['tokens'] != null ? new Tokens.fromJson(json['tokens']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['emailotp'] = this.emailotp;
    data['otpVerified'] = this.otpVerified;
    data['profile'] = this.profile;
    data['adminApprove'] = this.adminApprove;
    data['adminBlock'] = this.adminBlock;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['agoraToken'] = this.agoraToken;
    if (this.tokens != null) {
      data['tokens'] = this.tokens!.toJson();
    }
    return data;
  }
}

class Tokens {
  String? accessToken;
  String? refreshToken;
  String? accessExpiryTime;
  String? refreshExpiryTime;

  Tokens(
      {this.accessToken,
      this.refreshToken,
      this.accessExpiryTime,
      this.refreshExpiryTime});

  Tokens.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    accessExpiryTime = json['accessExpiryTime'];
    refreshExpiryTime = json['refreshExpiryTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    data['accessExpiryTime'] = this.accessExpiryTime;
    data['refreshExpiryTime'] = this.refreshExpiryTime;
    return data;
  }
}

