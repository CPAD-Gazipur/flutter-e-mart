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
  static getCategoryProducts({required String category}) {
    return firebaseFirestore
        .collection(productCollection)
        .where('p_category', isEqualTo: category)
        .snapshots();
  }

  /// GET ALL PRODUCT
  static getAllProducts() {
    return firebaseFirestore.collection(productCollection).snapshots();
  }

  /// GET CARTED PRODUCTS
  static getCartedProducts({required String uID}) {
    return firebaseFirestore
        .collection(cartCollection)
        .where('p_buyerID', isEqualTo: uID)
        .snapshots();
  }

  /// REMOVE CART ITEM
  static removeCartItem({required String cartID}) {
    return firebaseFirestore.collection(cartCollection).doc(cartID).delete();
  }

  /// GET SHIPPING ADDRESS
  static getShippingAddresses() {
    return firebaseFirestore
        .collection(userCollection)
        .doc(auth.currentUser!.uid)
        .collection(deliveryAddressCollection)
        .snapshots();
  }

  /// GET ALL MESSAGES
  static getAllMessages({required String chatID}) {
    return firebaseFirestore
        .collection(chatCollection)
        .doc(chatID)
        .collection(messageCollection)
        .orderBy('sending_time', descending: true)
        .snapshots();
  }
}
