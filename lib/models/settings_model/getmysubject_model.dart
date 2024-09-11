import 'dart:convert';

class MySubjectResponse {
  final bool? status;
  final String? message;
  final bool? isSubjectBookedMark;

  final List<UserData>? data;

  MySubjectResponse(
      {this.status, this.message, this.data, this.isSubjectBookedMark});

  factory MySubjectResponse.fromJson(Map<String, dynamic> json) {
    return MySubjectResponse(
      status: json['Status'] as bool?,
      message: json['message'] as String?,
      isSubjectBookedMark: json['isSubjectBookedMark'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => UserData.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Status': status,
      'message': message,
      'data': data?.map((item) => item.toJson()).toList(),
    };
  }
}

class UserData {
  final String? id;
  final String? userId;
  final String? name;
  final String? bio;
  final String? yourOneLiner;
  final String? linkToYourBio;
  final String? amount;
  List<String>? languages;
  final String? image;
  final List<dynamic>? attachment;
  final List<String?>? attachmentProof;
  final List<String?>? attachmentIDProof;
  final String? area;
  final bool? adminBlock;
  final List<String>? socialMediaLinks;
  final List<String>? mySubject;
  final String? preferredSessionType;
  final String? adminStatus;
  final String? teacherStatus;
  final String? selectYourSession;
  final String? setYourFeeForPreBookedSession;
  final bool? profileVisible;
  final bool? vedioCallRecordings;
  final bool? preBookedSessions;
  final bool? voiceCallRecordings;
  final String? pricePerMinute;
  final String? categoryText;
  final List<NewTiming>? newTiming;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final bool? isBookedMark;
  final bool? isSubjectBookedMark;
  final UserDetails? userDetails;

  UserData({
    this.id,
    this.userId,
    this.name,
    this.bio,
    this.yourOneLiner,
    this.linkToYourBio,
    this.amount,
    this.languages,
    this.image,
    this.attachment,
    this.attachmentProof,
    this.attachmentIDProof,
    this.area,
    this.adminBlock,
    this.socialMediaLinks,
    this.mySubject,
    this.preferredSessionType,
    this.adminStatus,
    this.teacherStatus,
    this.selectYourSession,
    this.setYourFeeForPreBookedSession,
    this.profileVisible,
    this.vedioCallRecordings,
    this.preBookedSessions,
    this.voiceCallRecordings,
    this.pricePerMinute,
    this.categoryText,
    this.newTiming,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.isBookedMark,
    this.isSubjectBookedMark,
    this.userDetails,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['_id'] as String?,
      userId: json['user_id'] as String?,
      name: json['name'] as String?,
      bio: json['bio'] as String?,
      yourOneLiner: json['yourOneLiner'] as String?,
      linkToYourBio: json['linkToYourBio'] as String?,
      amount: json['amount'] as String?,
      languages:
          json['languages'] != null ? json['languages'].cast<String>() : [],
      image: json['image'] as String?,
      attachment: json['attachment'] as List<dynamic>?,
      attachmentProof: (json['attachmentProof'] as List<dynamic>?)
          ?.map((item) => item as String?)
          .toList(),
      attachmentIDProof: (json['attachmentIDProof'] as List<dynamic>?)
          ?.map((item) => item as String?)
          .toList(),
      area: json['area'] as String?,
      adminBlock: json['adminBlock'] as bool?,
      socialMediaLinks: (json['socialMediaLinks'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
      mySubject: (json['mySubject'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
      preferredSessionType: json['preferredSessionType'] as String?,
      adminStatus: json['adminStatus'] as String?,
      teacherStatus: json['teacherStatus'] as String?,
      selectYourSession: json['selectYourSession'] as String?,
      setYourFeeForPreBookedSession:
          json['setYourFeeForPreBookedSession'] as String?,
      profileVisible: json['profileVisible'] as bool?,
      vedioCallRecordings: json['vedioCallRecordings'] as bool?,
      preBookedSessions: json['preBookedSessions'] as bool?,
      voiceCallRecordings: json['voiceCallRecordings'] as bool?,
      pricePerMinute: json['pricePerMinute'] as String?,
      categoryText: json['categoryText'] as String?,
      newTiming: (json['newTiming'] as List<dynamic>?)
          ?.map((item) => NewTiming.fromJson(item as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['__v'] as int?,
      isBookedMark: json['isBookedMark'] as bool?,
      isSubjectBookedMark: json['isSubjectBookedMark'] as bool?,
      userDetails: json['userDetails'] != null
          ? UserDetails.fromJson(json['userDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'user_id': userId,
      'name': name,
      'bio': bio,
      'yourOneLiner': yourOneLiner,
      'linkToYourBio': linkToYourBio,
      'amount': amount,
      'languages': languages,
      'image': image,
      'attachment': attachment,
      'attachmentProof': attachmentProof,
      'attachmentIDProof': attachmentIDProof,
      'area': area,
      'adminBlock': adminBlock,
      'socialMediaLinks': socialMediaLinks,
      'mySubject': mySubject,
      'preferredSessionType': preferredSessionType,
      'adminStatus': adminStatus,
      'teacherStatus': teacherStatus,
      'selectYourSession': selectYourSession,
      'setYourFeeForPreBookedSession': setYourFeeForPreBookedSession,
      'profileVisible': profileVisible,
      'vedioCallRecordings': vedioCallRecordings,
      'preBookedSessions': preBookedSessions,
      'voiceCallRecordings': voiceCallRecordings,
      'pricePerMinute': pricePerMinute,
      'categoryText': categoryText,
      'newTiming': newTiming?.map((item) => item.toJson()).toList(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'isSubjectBookedMark': isSubjectBookedMark,
      '__v': v,
      'isBookedMark': isBookedMark,
      'userDetails': userDetails?.toJson(),
    };
  }
}

class NewTiming {
  final String? date;
  final List<Slot>? slots;
  final String? id;

  NewTiming({this.date, this.slots, this.id});

  factory NewTiming.fromJson(Map<String, dynamic> json) {
    return NewTiming(
      date: json['date'] as String?,
      slots: (json['slots'] as List<dynamic>?)
          ?.map((item) => Slot.fromJson(item as Map<String, dynamic>))
          .toList(),
      id: json['_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'slots': slots?.map((item) => item.toJson()).toList(),
      '_id': id,
    };
  }
}

class Slot {
  final String? timing;
  final bool? isBooked;
  final String? id;

  Slot({this.timing, this.isBooked, this.id});

  factory Slot.fromJson(Map<String, dynamic> json) {
    return Slot(
      timing: json['timing'] as String?,
      isBooked: json['isBooked'] as bool?,
      id: json['_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'timing': timing,
      'isBooked': isBooked,
      '_id': id,
    };
  }
}

class UserDetails {
  final String? id;
  final String? name;
  final String? password;
  final String? email;
  final String? token;
  final String? emailotp;
  final bool? otpVerified;
  final bool? forgetOtpVerified;
  final bool? profile;
  final bool? adminApprove;
  final bool? adminBlock;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final String? type;

  UserDetails({
    this.id,
    this.name,
    this.password,
    this.email,
    this.token,
    this.emailotp,
    this.otpVerified,
    this.forgetOtpVerified,
    this.profile,
    this.adminApprove,
    this.adminBlock,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.type,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      password: json['password'] as String?,
      email: json['email'] as String?,
      token: json['token'] as String?,
      emailotp: json['emailotp'] as String?,
      otpVerified: json['otp_verified'] as bool?,
      forgetOtpVerified: json['forget_otp_verified'] as bool?,
      profile: json['profile'] as bool?,
      adminApprove: json['adminApprove'] as bool?,
      adminBlock: json['adminBlock'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['__v'] as int?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'password': password,
      'email': email,
      'token': token,
      'emailotp': emailotp,
      'otp_verified': otpVerified,
      'forget_otp_verified': forgetOtpVerified,
      'profile': profile,
      'adminApprove': adminApprove,
      'adminBlock': adminBlock,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
      'type': type,
    };
  }
}
