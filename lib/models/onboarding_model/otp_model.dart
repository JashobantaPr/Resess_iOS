class UserOtpVerifyModel {
  String? sId;
  String? name;
  String? password;
  String? email;
  String? token;
  String? emailotp;
  bool? otpVerified;
  bool? adminApprove;
  bool? adminBlock;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserOtpVerifyModel(
      {this.sId,
      this.name,
      this.password,
      this.email,
      this.token,
      this.emailotp,
      this.otpVerified,
      this.adminApprove,
      this.adminBlock,
      this.createdAt,
      this.updatedAt,
      this.iV});

  UserOtpVerifyModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    password = json['password'];
    email = json['email'];
    token = json['token'];
    emailotp = json['emailotp'];
    otpVerified = json['otpVerified'];
    adminApprove = json['adminApprove'];
    adminBlock = json['adminBlock'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['password'] = this.password;
    data['email'] = this.email;
    data['token'] = this.token;
    data['emailotp'] = this.emailotp;
    data['otpVerified'] = this.otpVerified;
    data['adminApprove'] = this.adminApprove;
    data['adminBlock'] = this.adminBlock;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
