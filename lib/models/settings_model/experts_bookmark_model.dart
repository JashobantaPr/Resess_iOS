class BookmarkedExpert {
  String? id;
  String? userId;
  String? expertId;
  bool? isBookmarked;
  String? name;
  String? bio;
  String? yourOneLiner;
  String? linkToYourBio;
  String? amount;
  List<List<String>>? languages; // Adjusted to match the response structure
  String? image;
  String? pricePerMinute;
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
  bool? videoCallRecordings;
  bool? preBookedSessions;
  bool? voiceCallRecordings;
  List<NewTiming>? newTiming; // Ensure this is handled
  List<Timing>? timings; // Ensure this is handled

  BookmarkedExpert({
    this.id,
    this.userId,
    this.expertId,
    this.isBookmarked,
    this.name,
    this.bio,
    this.yourOneLiner,
    this.linkToYourBio,
    this.amount,
    this.languages,
    this.image,
    this.pricePerMinute,
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
    this.videoCallRecordings,
    this.preBookedSessions,
    this.voiceCallRecordings,
    this.newTiming,
    this.timings,
  });

  factory BookmarkedExpert.fromJson(Map<String, dynamic> json) {
    return BookmarkedExpert(
      id: json['_id'],
      userId: json['user_id'],
      expertId: json['expert_id'],
      isBookmarked: json['isBookedMark'],
      name: json['name'],
      bio: json['bio'],
      yourOneLiner: json['yourOneLiner'],
      linkToYourBio: json['linkToYourBio'],
      amount: json['amount'],
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => List<String>.from(e))
          .toList(),
      image: json['image'],
      pricePerMinute: json['pricePerMinute'],
      attachment: (json['attachment'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
      attachmentProof: (json['attachmentProof'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
      attachmentIDProof: (json['attachmentIDProof'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
      area: json['area'],
      adminBlock: json['adminBlock'],
      socialMediaLinks: (json['socialMediaLinks'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
      mySubject: (json['mySubject'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
      preferredSessionType: json['preferredSessionType'],
      adminStatus: json['adminStatus'],
      teacherStatus: json['teacherStatus'],
      selectYourSession: json['selectYourSession'],
      setYourFeeForPreBookedSession: json['setYourFeeForPreBookedSession'],
      profileVisible: json['profileVisible'],
      videoCallRecordings: json['vedioCallRecordings'],
      preBookedSessions: json['preBookedSessions'],
      voiceCallRecordings: json['voiceCallRecordings'],
      newTiming: (json['newTiming'] as List<dynamic>?)
          ?.map((e) => NewTiming.fromJson(e as Map<String, dynamic>))
          .toList(),
      timings: (json['timings'] as List<dynamic>?)
          ?.map((e) => Timing.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'user_id': userId,
      'expert_id': expertId,
      'isBookedMark': isBookmarked,
      'name': name,
      'bio': bio,
      'yourOneLiner': yourOneLiner,
      'linkToYourBio': linkToYourBio,
      'amount': amount,
      'languages': languages,
      'image': image,
      'pricePerMinute': pricePerMinute,
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
      'vedioCallRecordings': videoCallRecordings,
      'preBookedSessions': preBookedSessions,
      'voiceCallRecordings': voiceCallRecordings,
      'newTiming': newTiming?.map((e) => e.toJson()).toList(),
      'timings': timings?.map((e) => e.toJson()).toList(),
    };
  }
}

class NewTiming {
  String? day;
  String? startTime;
  String? endTime;

  NewTiming({
    this.day,
    this.startTime,
    this.endTime,
  });

  factory NewTiming.fromJson(Map<String, dynamic> json) {
    return NewTiming(
      day: json['day'],
      startTime: json['startTime'],
      endTime: json['endTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'startTime': startTime,
      'endTime': endTime,
    };
  }
}

class Timing {
  String? day;
  String? startTime;
  String? endTime;

  Timing({
    this.day,
    this.startTime,
    this.endTime,
  });

  factory Timing.fromJson(Map<String, dynamic> json) {
    return Timing(
      day: json['day'],
      startTime: json['startTime'],
      endTime: json['endTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'startTime': startTime,
      'endTime': endTime,
    };
  }
}
