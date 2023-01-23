import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/models/category_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var currentImageIndex = 0.obs;
  var selectedQuantity = 1.obs;
  var selectedColorIndex = 0.obs;

  var totalPrice = 0.0.obs;

  var isLoading = false.obs;
  var isFavorite = false.obs;
  var isAlreadyCarted = false.obs;

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

  changeColorIndex(int index) {
    selectedColorIndex.value = index;
  }

  increaseQuantity({required int totalQuantity}) {
    if (selectedQuantity.value < totalQuantity) {
      selectedQuantity.value++;
    }
  }

  decreaseQuantity() {
    if (selectedQuantity.value > 1) {
      selectedQuantity.value--;
    }
  }

  calculateTotalPrice({required double price}) {
    totalPrice.value = price * selectedQuantity.value;
  }

  resetAllInitialization() {
    currentImageIndex.value = 0;
    selectedColorIndex.value = 0;
    selectedQuantity.value = 1;
  }

  checkAddToCartProduct({required String pID}) async {
    List<String> pList = [];

    var result = await firebaseFirestore
        .collection(userCollection)
        .doc(auth.currentUser!.uid)
        .get();

    List cartList = result.get('cart');

    for (var cart in cartList) {
      var cartResult =
          await firebaseFirestore.collection(cartCollection).doc(cart).get();

      var productID = cartResult.get('p_ID');

      pList.add(productID);
    }

    if (pList.contains(pID)) {
      isAlreadyCarted.value = true;
    } else {
      isAlreadyCarted.value = false;
    }

    debugPrint('IS CARTED: $isAlreadyCarted');
  }

  addToCart({
    required BuildContext context,
    required String pID,
    required String pTitle,
    required String pImage,
    required String seller,
    required String sellerID,
    required String totalPrice,
    required String pColor,
    required String pQuantity,
    required String buyerID,
  }) async {
    await firebaseFirestore.collection(cartCollection).add(
      {
        'p_ID': pID,
        'p_name': pTitle,
        'p_seller': seller,
        'p_image': pImage,
        'p_sellerID': sellerID,
        'totalPrice': totalPrice,
        'color': pColor,
        'quantity': pQuantity,
        'p_buyerID': buyerID,
      },
    ).catchError((e) {
      VxToast.show(
        context,
        msg: e.toString(),
        textColor: whiteColor,
        bgColor: redColor,
      );
    }).then(
      (value) async {
        await firebaseFirestore
            .collection(userCollection)
            .doc(auth.currentUser!.uid)
            .set({
          'cart': FieldValue.arrayUnion([value.id]),
        }, SetOptions(merge: true));
      },
    );
  }

  addProductToWishList({required String productID}) async {
    await firebaseFirestore.collection(productCollection).doc(productID).set({
      'p_wishlist': FieldValue.arrayUnion([auth.currentUser!.uid]),
    }, SetOptions(merge: true));
    await firebaseFirestore
        .collection(userCollection)
        .doc(auth.currentUser!.uid)
        .set({
      'wishlist': FieldValue.arrayUnion([productID]),
    }, SetOptions(merge: true));
    isFavorite(true);
  }

  removeProductFromWishList({required String productID}) async {
    await firebaseFirestore.collection(productCollection).doc(productID).set({
      'p_wishlist': FieldValue.arrayRemove([auth.currentUser!.uid]),
    }, SetOptions(merge: true));
    await firebaseFirestore
        .collection(userCollection)
        .doc(auth.currentUser!.uid)
        .set({
      'wishlist': FieldValue.arrayRemove([productID]),
    }, SetOptions(merge: true));
    isFavorite(false);
  }

  checkFavoriteProduct({required var productDetails}) async {
    if (productDetails['p_wishlist'].contains(auth.currentUser!.uid)) {
      isFavorite(true);
    } else {
      isFavorite(false);
    }
  }
}
