import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../consts/consts.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  /// LOGIN WITH EMAIL & PASSWORD
  Future<UserCredential?> loginWithEmailAndPassword({
    required BuildContext context,
  }) async {
    UserCredential? userCredential;

    if (emailController.text.isEmail && passwordController.text.length >= 6) {
      try {
        userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } on FirebaseAuthException catch (e) {
        VxToast.show(
          context,
          msg: e.toString().split(']')[1].trim(),
          textColor: whiteColor,
          bgColor: redColor,
        );
        debugPrint('Login Error: $e');
      }
    } else if (emailController.text.isEmpty) {
      VxToast.show(
        context,
        msg: 'Email can\'t be empty',
        textColor: whiteColor,
        bgColor: redColor,
      );
    } else if (!emailController.text.isEmail) {
      VxToast.show(
        context,
        msg: 'Enter an valid Email address',
        textColor: whiteColor,
        bgColor: redColor,
      );
    } else if (passwordController.text.isEmpty) {
      VxToast.show(
        context,
        msg: 'Password can\'t be empty',
        textColor: whiteColor,
        bgColor: redColor,
      );
    } else if (passwordController.text.length < 6) {
      VxToast.show(
        context,
        msg: 'Password must at least 6 digit',
        textColor: whiteColor,
        bgColor: redColor,
      );
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
      'cart': [],
      'wishlist': [],
      'orders': [],
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
