class UpcomingUserBookingsModel {
  String? sId;
  String? userId;
  String? expertId;
  String? amount;
  String? levelOfSubjectKnowledge;
  bool? isBooked;
  String? chooseDate;
  String? chooseTime;
  String? preferredSessionType;
  String? message;
  String? selectYourSession;
  List<String>? attachment;
  List<String>? attachmentProof;
  List<String>? attachmentIDProof;
  List<String>? socialMediaLinks;
  List<String>? mySubject;
  List<String>? newTiming;
  String? createdAt;
  String? updatedAt;
  int? iV;
  Expert? expert;

  UpcomingUserBookingsModel(
      {this.sId,
      this.userId,
      this.expertId,
      this.amount,
      this.levelOfSubjectKnowledge,
      this.isBooked,
      this.chooseDate,
      this.chooseTime,
      this.preferredSessionType,
      this.message,
      this.selectYourSession,
      this.attachment,
      this.attachmentProof,
      this.attachmentIDProof,
      this.socialMediaLinks,
      this.mySubject,
      this.newTiming,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.expert});

  UpcomingUserBookingsModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['user_id'];
    expertId = json['expert_id'];
    amount = json['amount'];
    levelOfSubjectKnowledge = json['levelOfSubjectKnowledge'];
    isBooked = json['isBooked'];
    chooseDate = json['chooseDate'];
    chooseTime = json['chooseTime'];
    preferredSessionType = json['preferredSessionType'];
    message = json['message'];
    selectYourSession = json['selectYourSession'];
    attachment = json['attachment'] != null && json['attachment'] is List
        ? List<String>.from(json['attachment'].whereType<String>())
        : [];

    attachmentProof =
        json['attachmentProof'] != null && json['attachmentProof'] is List
            ? List<String>.from(json['attachmentProof'].whereType<String>())
            : [];

    attachmentIDProof =
        json['attachmentIDProof'] != null && json['attachmentIDProof'] is List
            ? List<String>.from(json['attachmentIDProof'].whereType<String>())
            : [];

    socialMediaLinks =
        json['socialMediaLinks'] != null && json['socialMediaLinks'] is List
            ? List<String>.from(json['socialMediaLinks'].whereType<String>())
            : [];

    mySubject = json['mySubject'] != null && json['mySubject'] is List
        ? List<String>.from(json['mySubject'].whereType<String>())
        : [];

    newTiming = json['newTiming'] != null && json['newTiming'] is List
        ? List<String>.from(json['newTiming'].whereType<String>())
        : [];

    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    expert =
        json['expert'] != null ? new Expert.fromJson(json['expert']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user_id'] = this.userId;
    data['expert_id'] = this.expertId;
    data['amount'] = this.amount;
    data['levelOfSubjectKnowledge'] = this.levelOfSubjectKnowledge;
    data['isBooked'] = this.isBooked;
    data['chooseDate'] = this.chooseDate;
    data['chooseTime'] = this.chooseTime;
    data['preferredSessionType'] = this.preferredSessionType;
    data['message'] = this.message;
    data['selectYourSession'] = this.selectYourSession;
    data['attachment'] = this.attachment;
    data['attachmentProof'] = this.attachmentProof;
    data['attachmentIDProof'] = this.attachmentIDProof;
    data['socialMediaLinks'] = this.socialMediaLinks;
    data['mySubject'] = this.mySubject;
    data['newTiming'] = this.newTiming;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.expert != null) {
      data['expert'] = this.expert!.toJson();
    }
    return data;
  }
}

class Expert {
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

  Expert(
      {this.name,
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
      this.voiceCallRecordings});

  Expert.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    bio = json['bio'];
    yourOneLiner = json['yourOneLiner'];
    linkToYourBio = json['linkToYourBio'];
    amount = json['amount'];
    languages = json['languages'].cast<String>();
    image = json['image'];
    attachment = json['attachment'].cast<String>();
    attachmentProof = json['attachmentProof'].cast<String>();
    attachmentIDProof = json['attachmentIDProof'].cast<String>();
    area = json['area'];
    adminBlock = json['adminBlock'];
    socialMediaLinks = json['socialMediaLinks'].cast<String>();
    mySubject = json['mySubject'].cast<String>();
    preferredSessionType = json['preferredSessionType'];
    adminStatus = json['adminStatus'];
    teacherStatus = json['teacherStatus'];
    selectYourSession = json['selectYourSession'];
    setYourFeeForPreBookedSession = json['setYourFeeForPreBookedSession'];
    profileVisible = json['profileVisible'];
    vedioCallRecordings = json['vedioCallRecordings'];
    preBookedSessions = json['preBookedSessions'];
    voiceCallRecordings = json['voiceCallRecordings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['bio'] = this.bio;
    data['yourOneLiner'] = this.yourOneLiner;
    data['linkToYourBio'] = this.linkToYourBio;
    data['amount'] = this.amount;
    data['languages'] = this.languages;
    data['image'] = this.image;
    data['attachment'] = this.attachment;
    data['attachmentProof'] = this.attachmentProof;
    data['attachmentIDProof'] = this.attachmentIDProof;
    data['area'] = this.area;
    data['adminBlock'] = this.adminBlock;
    data['socialMediaLinks'] = this.socialMediaLinks;
    data['mySubject'] = this.mySubject;
    data['preferredSessionType'] = this.preferredSessionType;
    data['adminStatus'] = this.adminStatus;
    data['teacherStatus'] = this.teacherStatus;
    data['selectYourSession'] = this.selectYourSession;
    data['setYourFeeForPreBookedSession'] = this.setYourFeeForPreBookedSession;
    data['profileVisible'] = this.profileVisible;
    data['vedioCallRecordings'] = this.vedioCallRecordings;
    data['preBookedSessions'] = this.preBookedSessions;
    data['voiceCallRecordings'] = this.voiceCallRecordings;
    return data;
  }
}
