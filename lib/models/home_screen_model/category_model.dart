import 'sub_category_model.dart';

class CategoryModel {
  String? sId;
  String? adminId;
  String? categoryText;
  String? createdAt;
  String? updatedAt;
  int? iV;
  List<SubCategoryModel>? subCategories;
  bool? isSelected;

  CategoryModel(
      {this.sId,
      this.adminId,
      this.categoryText,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.isSelected = false,
      this.subCategories});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    isSelected = false;
    sId = json['_id'];
    adminId = json['admin_id'];
    categoryText = json['categoryText'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['admin_id'] = this.adminId;
    data['categoryText'] = this.categoryText;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
