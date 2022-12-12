import 'package:flutter_e_mart/consts/consts.dart';

class FirestoreServices {
  /// GET USER DATA
  static getUserInfo({required String uID}) {
    return firebaseFirestore
        .collection(userCollection)
        .where('uID', isEqualTo: uID)
        .snapshots();
  }

  /// GET PRODUCT ACCORDING TO CATEGORY
  static getProducts({required String category}) {
    return firebaseFirestore
        .collection(productCollection)
        .where('p_category', isEqualTo: category)
        .snapshots();
  }
}
