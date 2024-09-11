class GetNotificationModel {
  String? typeOfSession;
  String? levelOfSubjectKnowledge;
  String? expertStatus;
  String? message;
  String? sId;
  String? userId;
  bool? userBlock;
  String? type;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? expertId;
  String? bookingId;
  NotificationData? notificationData;
  String? preBookSessionId;

  GetNotificationModel(
      {this.typeOfSession,
      this.levelOfSubjectKnowledge,
      this.expertStatus,
      this.message,
      this.sId,
      this.userId,
      this.userBlock,
      this.type,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.expertId,
      this.bookingId,
      this.notificationData,
      this.preBookSessionId});

  GetNotificationModel.fromJson(Map<String, dynamic> json) {
    typeOfSession = json['typeOfSession'];
    levelOfSubjectKnowledge = json['levelOfSubjectKnowledge'];
    expertStatus = json['expertStatus'];
    message = json['message'];
    sId = json['_id'];
    userId = json['user_id'];
    userBlock = json['userBlock'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    expertId = json['expert_id'];
    bookingId = json['booking_id'];
    notificationData = json['notificationData'] != null
        ? new NotificationData.fromJson(json['notificationData'])
        : null;
    preBookSessionId = json['preBookSession_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['typeOfSession'] = this.typeOfSession;
    data['levelOfSubjectKnowledge'] = this.levelOfSubjectKnowledge;
    data['expertStatus'] = this.expertStatus;
    data['message'] = this.message;
    data['_id'] = this.sId;
    data['user_id'] = this.userId;
    data['userBlock'] = this.userBlock;
    data['type'] = this.type;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['expert_id'] = this.expertId;
    data['booking_id'] = this.bookingId;
    if (this.notificationData != null) {
      data['notificationData'] = this.notificationData!.toJson();
    }
    data['preBookSession_id'] = this.preBookSessionId;
    return data;
  }
}

class NotificationData {
  String? title;
  String? body;
  String? icon;
  String? chooseDate;
  String? chooseTime;

  NotificationData(
      {this.title, this.body, this.icon, this.chooseDate, this.chooseTime});

  NotificationData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    icon = json['icon'];
    chooseDate = json['chooseDate'];
    chooseTime = json['chooseTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['body'] = this.body;
    data['icon'] = this.icon;
    data['chooseDate'] = this.chooseDate;
    data['chooseTime'] = this.chooseTime;
    return data;
  }
}
