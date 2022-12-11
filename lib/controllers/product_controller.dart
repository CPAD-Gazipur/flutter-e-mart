import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_e_mart/models/category_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var subCategory = [];

  getSubCategories({required String title}) async {
    subCategory.clear();
    dynamic data = await rootBundle.loadString("lib/services/categories.json");
    var categoryModel = CategoryModel.fromJson(jsonDecode(data));

    var categoryList = categoryModel.categories!
        .where((element) => element.name == title)
        .toList();

    for (var subCat in categoryList[0].subCategory!) {
      subCategory.add(subCat);
    }
  }
}
