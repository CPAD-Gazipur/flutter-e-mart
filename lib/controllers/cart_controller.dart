import 'package:get/get.dart';

class CartController extends GetxController {
  var cartTotalPrice = 0.0.obs;

  calculateCartedAllProductPrice({required var data}) {
    cartTotalPrice.value = 0.0;
    for (var i = 0; i < data.length; i++) {
      cartTotalPrice.value =
          cartTotalPrice.value + double.parse(data[i]['totalPrice'].toString());
    }
  }
}
