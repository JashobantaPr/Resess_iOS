class LearnerPassSessionsModel {
  String? day;
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
  List<String>? languages;
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
  Rating? rating;

  LearnerPassSessionsModel(
      {this.day,
      this.sId,
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
      this.languages,
      this.attachment,
      this.attachmentProof,
      this.attachmentIDProof,
      this.socialMediaLinks,
      this.mySubject,
      this.newTiming,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.expert,
      this.rating});

  LearnerPassSessionsModel.fromJson(Map<String, dynamic> json) {
    day = json['day'];
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
    languages = json['languages'].cast<String>();
    attachment = json['attachment'].cast<String>();
    attachmentProof = json['attachmentProof'].cast<String>();
    attachmentIDProof = json['attachmentIDProof'].cast<String>();
    socialMediaLinks = json['socialMediaLinks'].cast<String>();
    mySubject = json['mySubject'].cast<String>();
    newTiming = json['newTiming'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    expert =
        json['expert'] != null ? new Expert.fromJson(json['expert']) : null;
    rating =
        json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
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
    data['languages'] = this.languages;
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
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
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
  var rating;

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
      this.voiceCallRecordings,
      this.rating});

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
    rating = json['rating'];
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
    data['rating'] = this.rating;
    return data;
  }
}

class Rating {
  String? sId;
  String? userId;
  String? expertId;
  var rating;
  String? description;
  Reply? reply;

  Rating(
      {this.sId,
      this.userId,
      this.expertId,
      this.rating,
      this.description,
      this.reply});

  Rating.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['user_id'];
    expertId = json['expert_id'];
    rating = json['rating'];
    description = json['description'];
    reply = json['reply'] != null ? new Reply.fromJson(json['reply']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user_id'] = this.userId;
    data['expert_id'] = this.expertId;
    data['rating'] = this.rating;
    data['description'] = this.description;
    if (this.reply != null) {
      data['reply'] = this.reply!.toJson();
    }
    return data;
  }
}

class Reply {
  String? text;
  CommentDetails? commentDetails;

  Reply({this.text, this.commentDetails});

  Reply.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    commentDetails = json['commentDetails'] != null
        ? new CommentDetails.fromJson(json['commentDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    if (this.commentDetails != null) {
      data['commentDetails'] = this.commentDetails!.toJson();
    }
    return data;
  }
}

class CommentDetails {
  String? name;
  String? image;

  CommentDetails({this.name, this.image});

  CommentDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}
