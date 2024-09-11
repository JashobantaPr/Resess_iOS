class SubCategoryModel {
  String? sId;
  String? adminId;
  String? categoryId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? subject;

  SubCategoryModel(
      {this.sId,
      this.adminId,
      this.categoryId,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.subject});

  SubCategoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    adminId = json['admin_id'];
    categoryId = json['category_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    subject = json['subject'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['admin_id'] = this.adminId;
    data['category_id'] = this.categoryId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['subject'] = this.subject;
    return data;
  }
}
