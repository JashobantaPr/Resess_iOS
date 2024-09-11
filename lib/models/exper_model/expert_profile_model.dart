class ExpertProfileModel {
  String? sId;
  String? userId;
  int? iV;
  bool? adminBlock;
  String? adminStatus;
  String? amount;
  String? area;
  List<String>? attachment;
  List<String>? attachmentIDProof;
  List<String>? attachmentProof;
  String? bio;
  String? categoryText;
  String? createdAt;
  String? image;
  bool? isBookedMark;
  List<String>? languages;
  String? linkToYourBio;
  List<String>? mySubject;
  String? name;
  List<String>? newTiming;
  bool? onlineOffline;
  bool? preBookedSessions;
  String? preferredSessionType;
  String? pricePerMinute;
  bool? profileVisible;
  int? rating;
  String? selectYourSession;
  String? setYourFeeForPreBookedSession;
  List<String>? socialMediaLinks;
  bool? status;
  String? teacherStatus;
  int? totalSlots;
  String? updatedAt;
  bool? vedioCallRecordings;
  bool? voiceCallRecordings;
  String? yourOneLiner;

  ExpertProfileModel(
      {this.sId,
      this.userId,
      this.iV,
      this.adminBlock,
      this.adminStatus,
      this.amount,
      this.area,
      this.attachment,
      this.attachmentIDProof,
      this.attachmentProof,
      this.bio,
      this.categoryText,
      this.createdAt,
      this.image,
      this.isBookedMark,
      this.languages,
      this.linkToYourBio,
      this.mySubject,
      this.name,
      this.newTiming,
      this.onlineOffline,
      this.preBookedSessions,
      this.preferredSessionType,
      this.pricePerMinute,
      this.profileVisible,
      this.rating,
      this.selectYourSession,
      this.setYourFeeForPreBookedSession,
      this.socialMediaLinks,
      this.status,
      this.teacherStatus,
      this.totalSlots,
      this.updatedAt,
      this.vedioCallRecordings,
      this.voiceCallRecordings,
      this.yourOneLiner});

  ExpertProfileModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['user_id'];
    iV = json['__v'];
    adminBlock = json['adminBlock'];
    adminStatus = json['adminStatus'];
    amount = json['amount'];
    area = json['area'];
    attachment = json['attachment'].cast<String>();
    attachmentIDProof = json['attachmentIDProof'].cast<String>();
    attachmentProof = json['attachmentProof'].cast<String>();
    bio = json['bio'];
    categoryText = json['categoryText'];
    createdAt = json['createdAt'];
    image = json['image'];
    isBookedMark = json['isBookedMark'];
    languages = json['languages'].cast<String>();
    linkToYourBio = json['linkToYourBio'];
    mySubject = json['mySubject'].cast<String>();
    name = json['name'];
    newTiming = json['newTiming'].cast<String>();
    onlineOffline = json['onlineOffline'];
    preBookedSessions = json['preBookedSessions'];
    preferredSessionType = json['preferredSessionType'];
    pricePerMinute = json['pricePerMinute'];
    profileVisible = json['profileVisible'];
    rating = json['rating'];
    selectYourSession = json['selectYourSession'];
    setYourFeeForPreBookedSession = json['setYourFeeForPreBookedSession'];
    socialMediaLinks = json['socialMediaLinks'].cast<String>();
    status = json['status'];
    teacherStatus = json['teacherStatus'];
    totalSlots = json['totalSlots'];
    updatedAt = json['updatedAt'];
    vedioCallRecordings = json['vedioCallRecordings'];
    voiceCallRecordings = json['voiceCallRecordings'];
    yourOneLiner = json['yourOneLiner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user_id'] = this.userId;
    data['__v'] = this.iV;
    data['adminBlock'] = this.adminBlock;
    data['adminStatus'] = this.adminStatus;
    data['amount'] = this.amount;
    data['area'] = this.area;
    data['attachment'] = this.attachment;
    data['attachmentIDProof'] = this.attachmentIDProof;
    data['attachmentProof'] = this.attachmentProof;
    data['bio'] = this.bio;
    data['categoryText'] = this.categoryText;
    data['createdAt'] = this.createdAt;
    data['image'] = this.image;
    data['isBookedMark'] = this.isBookedMark;
    data['languages'] = this.languages;
    data['linkToYourBio'] = this.linkToYourBio;
    data['mySubject'] = this.mySubject;
    data['name'] = this.name;
    data['newTiming'] = this.newTiming;
    data['onlineOffline'] = this.onlineOffline;
    data['preBookedSessions'] = this.preBookedSessions;
    data['preferredSessionType'] = this.preferredSessionType;
    data['pricePerMinute'] = this.pricePerMinute;
    data['profileVisible'] = this.profileVisible;
    data['rating'] = this.rating;
    data['selectYourSession'] = this.selectYourSession;
    data['setYourFeeForPreBookedSession'] = this.setYourFeeForPreBookedSession;
    data['socialMediaLinks'] = this.socialMediaLinks;
    data['status'] = this.status;
    data['teacherStatus'] = this.teacherStatus;
    data['totalSlots'] = this.totalSlots;
    data['updatedAt'] = this.updatedAt;
    data['vedioCallRecordings'] = this.vedioCallRecordings;
    data['voiceCallRecordings'] = this.voiceCallRecordings;
    data['yourOneLiner'] = this.yourOneLiner;
    return data;
  }
}
