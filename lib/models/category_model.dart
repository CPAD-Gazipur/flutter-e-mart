class CategoryModel {
  List<CategoryModelCategories>? categories;

  CategoryModel({
    required this.categories,
  });
  CategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      final v = json['categories'];
      final arr0 = <CategoryModelCategories>[];
      v.forEach((v) {
        arr0.add(CategoryModelCategories.fromJson(v));
      });
      categories = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (categories != null) {
      final v = categories;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v.toJson());
      }
      data['categories'] = arr0;
    }
    return data;
  }
}

class CategoryModelCategories {
  String? name;
  List<String>? subCategory;

  CategoryModelCategories({
    required this.name,
    required this.subCategory,
  });
  CategoryModelCategories.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    if (json['sub_category'] != null) {
      final v = json['sub_category'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      subCategory = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    if (subCategory != null) {
      final v = subCategory;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v);
      }
      data['sub_category'] = arr0;
    }
    return data;
  }
}
