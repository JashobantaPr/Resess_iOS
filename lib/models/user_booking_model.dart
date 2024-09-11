class BookingData {
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
  String? sId;
  List<String>? newTiming;
  String? createdAt;
  String? updatedAt;
  int? iV;

  BookingData(
      {this.userId,
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
      this.sId,
      this.newTiming,
      this.createdAt,
      this.updatedAt,
      this.iV});

  BookingData.fromJson(Map<String, dynamic> json) {
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
    attachment =
        json['attachment'] != null ? json['attachment'].cast<String>() : null;

    attachmentProof = json['attachmentProof'] != null
        ? json["attachmentProof"].cast<String>()
        : null;
    attachmentIDProof = json['attachmentIDProof'] != null
        ? json["attachmentIDProof"].cast<String>()
        : null;
    socialMediaLinks = json['socialMediaLinks'] != null
        ? json["socialMediaLinks"].cast<String>()
        : null;
    mySubject =
        json['mySubject'] != null ? json["mySubject"].cast<String>() : null;
    sId = json['_id'];
    newTiming =
        json['newTiming'] != null ? json["newTiming"].cast<String>() : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['_id'] = this.sId;
    data['newTiming'] = this.newTiming;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
