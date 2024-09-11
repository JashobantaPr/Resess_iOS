class AdminStatusModel {
  String? userId;
  String? image;
  String? adminStatus;
  bool? status;

  AdminStatusModel({this.userId, this.image, this.adminStatus, this.status});

  AdminStatusModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    image = json['image'];
    adminStatus = json['adminStatus'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['image'] = this.image;
    data['adminStatus'] = this.adminStatus;
    data['status'] = this.status;
    return data;
  }
}
