import 'dart:convert';

class ApiResponse {
  final bool status;
  final String message;
  final ExpertSetting data;  // Change this to a single ExpertSetting object

  ApiResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ApiResponse.fromJson(String str) => ApiResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ApiResponse.fromMap(Map<String, dynamic> json) => ApiResponse(
    status: json["Status"],
    message: json["message"],
    data: ExpertSetting.fromMap(json["data"]),  // Change this to single ExpertSetting object
  );

  Map<String, dynamic> toMap() => {
    "Status": status,
    "message": message,
    "data": data.toMap(),  // Change this to single ExpertSetting object
  };
}

class ExpertSetting {
  final String userId;
  final List<NewTiming> newTiming;
  final int totalSlots;
  final String preferredSessionType;
  final String teacherStatus;
  final String selectYourSession;
  final String adminStatus;
  final String setYourFeeForPreBookedSession;
  final bool profileVisible;
  final bool vedioCallRecordings;
  final bool preBookedSessions;
  final bool voiceCallRecordings;

  ExpertSetting({
    required this.userId,
    required this.newTiming,
    required this.totalSlots,
    required this.preferredSessionType,
    required this.teacherStatus,
    required this.selectYourSession,
    required this.adminStatus,
    required this.setYourFeeForPreBookedSession,
    required this.profileVisible,
    required this.vedioCallRecordings,
    required this.preBookedSessions,
    required this.voiceCallRecordings,
  });

  factory ExpertSetting.fromMap(Map<String, dynamic> json) => ExpertSetting(
    userId: json["user_id"],
    newTiming: List<NewTiming>.from(json["newTiming"].map((x) => NewTiming.fromMap(x))),
    totalSlots: json["totalSlots"],
    preferredSessionType: json["preferredSessionType"],
    teacherStatus: json["teacherStatus"],
    selectYourSession: json["selectYourSession"],
    adminStatus: json["adminStatus"],
    setYourFeeForPreBookedSession: json["setYourFeeForPreBookedSession"],
    profileVisible: json["profileVisible"],
    vedioCallRecordings: json["vedioCallRecordings"],
    preBookedSessions: json["preBookedSessions"],
    voiceCallRecordings: json["voiceCallRecordings"],
  );

  Map<String, dynamic> toMap() => {
    "user_id": userId,
    "newTiming": List<dynamic>.from(newTiming.map((x) => x.toMap())),
    "totalSlots": totalSlots,
    "preferredSessionType": preferredSessionType,
    "teacherStatus": teacherStatus,
    "selectYourSession": selectYourSession,
    "adminStatus": adminStatus,
    "setYourFeeForPreBookedSession": setYourFeeForPreBookedSession,
    "profileVisible": profileVisible,
    "vedioCallRecordings": vedioCallRecordings,
    "preBookedSessions": preBookedSessions,
    "voiceCallRecordings": voiceCallRecordings,
  };
}

class NewTiming {
  final String date;
  final List<Slot> slots;
  final String id;

  NewTiming({
    required this.date,
    required this.slots,
    required this.id,
  });

  factory NewTiming.fromJson(String str) => NewTiming.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NewTiming.fromMap(Map<String, dynamic> json) => NewTiming(
        date: json["date"],
        slots: List<Slot>.from(json["slots"].map((x) => Slot.fromMap(x))),
        id: json["_id"],
      );

  Map<String, dynamic> toMap() => {
        "date": date,
        "slots": List<dynamic>.from(slots.map((x) => x.toMap())),
        "_id": id,
      };
}

class Slot {
  final String timing;
  final bool isBooked;
  final String id;

  Slot({
    required this.timing,
    required this.isBooked,
    required this.id,
  });

  factory Slot.fromJson(String str) => Slot.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Slot.fromMap(Map<String, dynamic> json) => Slot(
        timing: json["timing"],
        isBooked: json["isBooked"],
        id: json["_id"],
      );

  Map<String, dynamic> toMap() => {
        "timing": timing,
        "isBooked": isBooked,
        "_id": id,
      };
}
