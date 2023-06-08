import 'package:flutter_e_mart/consts/consts.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentNaIndex = 0.obs;

  var userName = ''.obs;

  getUserName() async {
    var name = await firebaseFirestore
        .collection(userCollection)
        .where('uID', isEqualTo: auth.currentUser!.uid)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        return value.docs.single.get('name');
      }
    });

    if (name != null) userName.value = name;
  }

  @override
  void onInit() {
    getUserName();
    super.onInit();
  }
}
