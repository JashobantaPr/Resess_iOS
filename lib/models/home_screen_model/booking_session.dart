
class BookingModel {
  String? userId;
  List<NewTiming>? newTiming;
  int? totalSlots;
  List<String>? preferredSessionType;
  String? teacherStatus;
  String? selectYourSession;
  String? adminStatus;
  String? setYourFeeForPreBookedSession;
  bool? profileVisible;
  bool? vedioCallRecordings;
  bool? preBookedSessions;
  bool? voiceCallRecordings;

  BookingModel(
      {this.userId,
      this.newTiming,
      this.totalSlots,
      this.preferredSessionType,
      this.teacherStatus,
      this.selectYourSession,
      this.adminStatus,
      this.setYourFeeForPreBookedSession,
      this.profileVisible,
      this.vedioCallRecordings,
      this.preBookedSessions,
      this.voiceCallRecordings});

  BookingModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    if (json['newTiming'] != null) {
      newTiming = <NewTiming>[];
      json['newTiming'].forEach((v) {
        newTiming!.add(new NewTiming.fromJson(v));
      });
    }
    totalSlots = json['totalSlots'];
    preferredSessionType = json['preferredSessionType'].cast<String>();
    teacherStatus = json['teacherStatus'];
    selectYourSession = json['selectYourSession'];
    adminStatus = json['adminStatus'];
    setYourFeeForPreBookedSession = json['setYourFeeForPreBookedSession'];
    profileVisible = json['profileVisible'];
    vedioCallRecordings = json['vedioCallRecordings'];
    preBookedSessions = json['preBookedSessions'];
    voiceCallRecordings = json['voiceCallRecordings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    if (this.newTiming != null) {
      data['newTiming'] = this.newTiming!.map((v) => v.toJson()).toList();
    }
    data['totalSlots'] = this.totalSlots;
    data['preferredSessionType'] = this.preferredSessionType;
    data['teacherStatus'] = this.teacherStatus;
    data['selectYourSession'] = this.selectYourSession;
    data['adminStatus'] = this.adminStatus;
    data['setYourFeeForPreBookedSession'] = this.setYourFeeForPreBookedSession;
    data['profileVisible'] = this.profileVisible;
    data['vedioCallRecordings'] = this.vedioCallRecordings;
    data['preBookedSessions'] = this.preBookedSessions;
    data['voiceCallRecordings'] = this.voiceCallRecordings;
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
