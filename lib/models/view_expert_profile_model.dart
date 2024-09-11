class ExpertProfileResponse {
  final bool? status;
  final String? message;
  final ExpertProfileData? data;

  ExpertProfileResponse({this.status, this.message, this.data});

  factory ExpertProfileResponse.fromJson(Map<String, dynamic> json) {
    return ExpertProfileResponse(
      status: json['Status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] != null
          ? ExpertProfileData.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Status': status,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class ExpertProfileData {
  final ExpertProfile? profile;

  ExpertProfileData({this.profile});

  factory ExpertProfileData.fromJson(Map<String, dynamic> json) {
    return ExpertProfileData(
      profile: json['profile'] != null
          ? ExpertProfile.fromJson(json['profile'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'profile': profile?.toJson(),
    };
  }
}

class ExpertProfile {
  final String? id;
  final String? userId;
  final String? name;
  final String? bio;
  final String? yourOneLiner;
  final String? linkToYourBio;
  final String? amount;
  final String? languages;
  final String? image;
  final List<String>? attachment;
  final List<String>? attachmentProof;
  final List<String>? attachmentIDProof;
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
  final String? categoryText;
  final List<NewTiming>? newTiming;
  final String? createdAt;
  final String? updatedAt;

  ExpertProfile({
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
    this.categoryText,
    this.newTiming,
    this.createdAt,
    this.updatedAt,
  });

  factory ExpertProfile.fromJson(Map<String, dynamic> json) {
    return ExpertProfile(
      id: json['_id'] as String?,
      userId: json['user_id'] as String?,
      name: json['name'] as String?,
      bio: json['bio'] as String?,
      yourOneLiner: json['yourOneLiner'] as String?,
      linkToYourBio: json['linkToYourBio'] as String?,
      amount: json['amount'] as String?,
      languages: (json['languages'] is List<dynamic>)
          ? (json['languages'] as List<dynamic>).join(', ')
          : json['languages'] as String?,
      image: json['image'] as String?,
      attachment: (json['attachment'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      attachmentProof: (json['attachmentProof'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      attachmentIDProof: (json['attachmentIDProof'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      area: json['area'] as String?,
      adminBlock: json['adminBlock'] as bool?,
      socialMediaLinks: (json['socialMediaLinks'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      mySubject: (json['mySubject'] as List<dynamic>?)
          ?.map((e) => e as String)
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
      categoryText: json['categoryText'] as String?,
      newTiming: (json['newTiming'] as List<dynamic>?)
          ?.map((e) => NewTiming.fromJson(e))
          .toList(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
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
      'categoryText': categoryText,
      'newTiming': newTiming?.map((e) => e.toJson()).toList(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}

class NewTiming {
  final String? date;
  final List<TimingSlot>? slots;
  final String? id;

  NewTiming({this.date, this.slots, this.id});

  factory NewTiming.fromJson(Map<String, dynamic> json) {
    return NewTiming(
      date: json['date'] as String?,
      slots: (json['slots'] as List<dynamic>?)
          ?.map((e) => TimingSlot.fromJson(e))
          .toList(),
      id: json['_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'slots': slots?.map((e) => e.toJson()).toList(),
      '_id': id,
    };
  }
}

class TimingSlot {
  final String? timing;
  final bool? isBooked;
  final String? id;

  TimingSlot({this.timing, this.isBooked, this.id});

  factory TimingSlot.fromJson(Map<String, dynamic> json) {
    return TimingSlot(
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
