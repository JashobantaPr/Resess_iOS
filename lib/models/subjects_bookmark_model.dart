import 'dart:convert';

class BookMarkSubjectResponse {
  bool? status;
  String? message;
  BookMarkSubjectData? data;

  BookMarkSubjectResponse({
    this.status,
    this.message,
    this.data,
  });

  factory BookMarkSubjectResponse.fromJson(Map<String, dynamic> json) {
    return BookMarkSubjectResponse(
      status: json['Status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] != null
          ? BookMarkSubjectData.fromJson(json['data'])
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

class BookMarkSubjectData {
  String? userId;
  List<BookMark>? bookmarks;

  BookMarkSubjectData({
    this.userId,
    this.bookmarks,
  });

  factory BookMarkSubjectData.fromJson(Map<String, dynamic> json) {
    return BookMarkSubjectData(
      userId: json['user_id'] as String?,
      bookmarks: (json['bookmarks'] as List<dynamic>?)
          ?.map((item) => BookMark.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'bookmarks': bookmarks?.map((item) => item.toJson()).toList(),
    };
  }
}

class BookMark {
  String? id;
  String? userId;
  String? expertId;
  bool? isBookMark;
  bool? isSubjectBookedMark;
  String? name;
  String? bio;
  String? yourOneLiner;
  String? linkToYourBio;
  String? amount;
  List<String>? languages;
  String? image;
  List<String>? attachment;
  List<String>? attachmentProof;
  List<String>? attachmentIDProof;
  String? area;
  bool? adminBlock;
  List<String>? socialMediaLinks;
  List<String>? mySubject;
  String? preferredSessionType;
  String? adminStatus;
  String? teacherStatus;
  String? selectYourSession;
  String? setYourFeeForPreBookedSession;
  bool? profileVisible;
  bool? vedioCallRecordings;
  bool? preBookedSessions;
  bool? voiceCallRecordings;
  List<NewTiming>? newTiming;

  BookMark({
    this.id,
    this.userId,
    this.expertId,
    this.isBookMark,
    this.isSubjectBookedMark,
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
    this.newTiming,
  });

  factory BookMark.fromJson(Map<String, dynamic> json) {
    return BookMark(
      id: json['_id'] as String?,
      userId: json['user_id'] as String?,
      expertId: json['expert_id'] as String?,
      isBookMark: json['isBookedMark'] as bool?,
      isSubjectBookedMark: json['isSubjectBookedMark'] as bool?,
      name: json['name'] as String?,
      bio: json['bio'] as String?,
      yourOneLiner: json['yourOneLiner'] as String?,
      linkToYourBio: json['linkToYourBio'] as String?,
      amount: json['amount'] as String?,
      languages: (json['languages'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
      image: json['image'] as String?,
      attachment: (json['attachment'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
      attachmentProof: (json['attachmentProof'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
      attachmentIDProof: (json['attachmentIDProof'] as List<dynamic>?)
          ?.map((item) => item as String)
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
      setYourFeeForPreBookedSession: json['setYourFeeForPreBookedSession'] as String?,
      profileVisible: json['profileVisible'] as bool?,
      vedioCallRecordings: json['vedioCallRecordings'] as bool?,
      preBookedSessions: json['preBookedSessions'] as bool?,
      voiceCallRecordings: json['voiceCallRecordings'] as bool?,
      newTiming: (json['newTiming'] as List<dynamic>?)
          ?.map((item) => NewTiming.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'user_id': userId,
      'expert_id': expertId,
      'isBookedMark': isBookMark,
      'isSubjectBookedMark': isSubjectBookedMark,
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
      'newTiming': newTiming?.map((item) => item.toJson()).toList(),
    };
  }
}

class NewTiming {
  String? date;
  List<Slot>? slots;

  NewTiming({
    this.date,
    this.slots,
  });

  factory NewTiming.fromJson(Map<String, dynamic> json) {
    return NewTiming(
      date: json['date'] as String?,
      slots: (json['slots'] as List<dynamic>?)
          ?.map((item) => Slot.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'slots': slots?.map((item) => item.toJson()).toList(),
    };
  }
}

class Slot {
  String? timing;
  bool? isBooked;
  String? id;

  Slot({
    this.timing,
    this.isBooked,
    this.id,
  });

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
