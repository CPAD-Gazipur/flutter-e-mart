import 'package:get/get.dart';

import '../consts/consts.dart';

class CartController extends GetxController {
  var cartTotalPrice = 0.0.obs;

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
}
