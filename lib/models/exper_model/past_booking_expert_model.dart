class getPastExpertBookingsModel {
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
  User? user;
  Rating? rating;

  getPastExpertBookingsModel(
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
      this.user,
      this.rating});

  getPastExpertBookingsModel.fromJson(Map<String, dynamic> json) {
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
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
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
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
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
