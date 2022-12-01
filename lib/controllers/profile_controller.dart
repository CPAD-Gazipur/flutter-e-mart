import 'package:flutter/services.dart';
import 'package:flutter_e_mart/consts/consts.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var profileImageUrl = ''.obs;

  uploadImage({
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
}
