class ApprovedExpertProfileModel {
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
  List<NewTiming>? newTiming;
  bool? notification;
  bool? onlineOffline;
  bool? preBookedSessions;
  List<String>? preferredSessionType;
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
  bool? isBookmarked;
  int? averageRating;

  ApprovedExpertProfileModel(
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
      this.notification,
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
      this.yourOneLiner,
      this.isBookmarked,
      this.averageRating});

  ApprovedExpertProfileModel.fromJson(Map<String, dynamic> json) {
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
    if (json['newTiming'] != null) {
      newTiming = <NewTiming>[];
      json['newTiming'].forEach((v) {
        newTiming!.add(new NewTiming.fromJson(v));
      });
    }
    notification = json['notification'];
    onlineOffline = json['onlineOffline'];
    preBookedSessions = json['preBookedSessions'];
    preferredSessionType = json['preferredSessionType'].cast<String>();
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
    isBookmarked = json['isBookmarked'];
    averageRating = json['averageRating'];
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
    if (this.newTiming != null) {
      data['newTiming'] = this.newTiming!.map((v) => v.toJson()).toList();
    }
    data['notification'] = this.notification;
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
    data['isBookmarked'] = this.isBookmarked;
    data['averageRating'] = this.averageRating;
    return data;
  }
}

class NewTiming {
  String? day;
  String? date;
  List<Slots>? slots;
  String? sId;

  NewTiming({this.day, this.date, this.slots, this.sId});

  NewTiming.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    date = json['date'];
    if (json['slots'] != null) {
      slots = <Slots>[];
      json['slots'].forEach((v) {
        slots!.add(new Slots.fromJson(v));
      });
    }
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['date'] = this.date;
    if (this.slots != null) {
      data['slots'] = this.slots!.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    return data;
  }
}

class Slots {
  String? timing;
  bool? isBooked;
  String? sId;

  Slots({this.timing, this.isBooked, this.sId});

  Slots.fromJson(Map<String, dynamic> json) {
    timing = json['timing'];
    isBooked = json['isBooked'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timing'] = this.timing;
    data['isBooked'] = this.isBooked;
    data['_id'] = this.sId;
    return data;
  }
}
