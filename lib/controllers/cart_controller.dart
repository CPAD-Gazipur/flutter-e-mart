import 'package:flutter_e_mart/controllers/controllers.dart';
import 'package:get/get.dart';

import '../consts/consts.dart';

class CartController extends GetxController {
  var cartTotalPrice = 0.0.obs;

  var paymentSelectedIndex = 0.obs;

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var streetAddressController = TextEditingController();
  var postalCodeController = TextEditingController();
  var cityController = TextEditingController();

  calculateCartedAllProductPrice({required var data}) {
    cartTotalPrice.value = 0.0;
    for (var i = 0; i < data.length; i++) {
      cartTotalPrice.value =
          cartTotalPrice.value + double.parse(data[i]['totalPrice'].toString());
    }
  }

  placeOrder() async {
    await firebaseFirestore.collection(orderCollection).doc().set({
      'order_by': auth.currentUser!.uid,
      'order_user_name': Get.find<HomeController>().userName,
      'order_user_email': auth.currentUser!.email,
    });
  }
}
