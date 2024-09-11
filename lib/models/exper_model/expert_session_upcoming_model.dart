class ExpertSessionUpcomingModel {
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
  User? user;

  ExpertSessionUpcomingModel(
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
      this.user});

  ExpertSessionUpcomingModel.fromJson(Map<String, dynamic> json) {
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
    attachment = json['attachment'].cast<String>();
    attachmentProof = json['attachmentProof'].cast<String>();
    attachmentIDProof = json['attachmentIDProof'].cast<String>();
    socialMediaLinks = json['socialMediaLinks'].cast<String>();
    mySubject = json['mySubject'].cast<String>();
    newTiming = json['newTiming'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
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
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? name;
  String? email;

  User({this.name, this.email});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}
