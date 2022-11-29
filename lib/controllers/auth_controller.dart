import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../consts/consts.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  /// LOGIN WITH EMAIL & PASSWORD
  Future<UserCredential?> loginWithEmailAndPassword({
    required BuildContext context,
  }) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
      debugPrint('Login Error: $e');
    }

    return userCredential;
  }

  /// SIGNUP WITH EMAIL & PASSWORD
  Future<UserCredential?> signUpWithEmailAndPassword({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
      debugPrint('SignUp Error: $e');
    }

    return userCredential;
  }

  /// STORE NEW USER DATA
  storeNewUserDataIntoFireStore({
    required String uID,
    required String name,
    required String email,
    required String imageUrl,
  }) async {
    DocumentReference userDoc =
        firebaseFirestore.collection(userCollection).doc(uID);
    userDoc.set({
      'name': name,
      'uID': uID,
      'email': email,
      'imageUrl': imageUrl,
    });
  }

  /// SING-OUT USER
  signOutUser({required BuildContext context}) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
