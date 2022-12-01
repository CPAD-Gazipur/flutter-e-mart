import 'package:flutter_e_mart/consts/consts.dart';

class FirestoreServices {
  static getUserInfo({required String uID}) {
    return firebaseFirestore
        .collection(userCollection)
        .where('uID', isEqualTo: uID)
        .snapshots();
  }
}
