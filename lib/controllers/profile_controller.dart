import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter_e_mart/consts/consts.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var profileImageUrl = ''.obs;

  var profileImageDownloadedUrl = ''.obs;

  var isLoading = false.obs;

  var nameController = TextEditingController();

  getImageFromGallery({
    required BuildContext context,
  }) async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
      );

      if (image == null) return;

      profileImageUrl.value = image.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
      debugPrint('Image Error: ${e.toString()}');
    }
  }

  uploadProfileImageToFireStore() async {
    var fileName = '${auth.currentUser!.uid}.jpg';
    var destination = 'profileImages/$fileName';

    Reference reference = FirebaseStorage.instance.ref().child(destination);

    await reference.putFile(File(profileImageUrl.value));

    profileImageDownloadedUrl.value = await reference.getDownloadURL();
  }

  updateProfileInfo({required String name, required String imageUrl}) async {
    var store =
        firebaseFirestore.collection(userCollection).doc(auth.currentUser!.uid);

    await store.set({
      'name': name,
      'imageUrl': imageUrl,
    }, SetOptions(merge: true));

    isLoading(false);
  }
}
