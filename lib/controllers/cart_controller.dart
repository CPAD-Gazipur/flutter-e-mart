import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_e_mart/controllers/controllers.dart';
import 'package:flutter_e_mart/models/shipping_address.dart';
import 'package:get/get.dart';

import '../consts/consts.dart';

class CartController extends GetxController {
  var isLoading = false.obs;

  var cartTotalPrice = 0.0.obs;

  var paymentSelectedIndex = 0.obs;
  var deliveryAddressSelectedIndex = 0.obs;

  dynamic productSnapshot;
  ShippingAddress? deliveryAddress;
  var products = [];

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var streetAddressController = TextEditingController();
  var postalCodeController = TextEditingController();
  var cityController = TextEditingController();

  var addressSelectedIndex = 0.obs;

  changePaymentIndex({required int index}) {
    paymentSelectedIndex.value = index;
  }

  calculateCartedAllProductPrice({required var data}) {
    cartTotalPrice.value = 0.0;
    for (var i = 0; i < data.length; i++) {
      cartTotalPrice.value =
          cartTotalPrice.value + double.parse(data[i]['totalPrice'].toString());
    }
  }

  saveOrUpdateShippingAddress({
    required BuildContext context,
    required bool isUpdate,
    String? addressID,
  }) async {
    if (nameController.text.isEmpty) {
      VxToast.show(
        context,
        msg: 'Name can\'t be empty',
        bgColor: redColor,
        textColor: whiteColor,
        position: VxToastPosition.center,
      );
    } else if (phoneController.text.isEmpty) {
      VxToast.show(
        context,
        msg: 'Phone can\'t be empty',
        bgColor: redColor,
        textColor: whiteColor,
        position: VxToastPosition.center,
      );
    } else if (streetAddressController.text.isEmpty) {
      VxToast.show(
        context,
        msg: 'Street address can\'t be empty',
        bgColor: redColor,
        textColor: whiteColor,
        position: VxToastPosition.center,
      );
    } else if (postalCodeController.text.isEmpty) {
      VxToast.show(
        context,
        msg: 'Postal code can\'t be empty',
        bgColor: redColor,
        textColor: whiteColor,
        position: VxToastPosition.center,
      );
    } else if (cityController.text.isEmpty) {
      VxToast.show(
        context,
        msg: 'City can\'t be empty',
        bgColor: redColor,
        textColor: whiteColor,
        position: VxToastPosition.center,
      );
    } else {
      showLoading(context);

      if (isUpdate) {
        await firebaseFirestore
            .collection(userCollection)
            .doc(auth.currentUser!.uid)
            .collection(deliveryAddressCollection)
            .doc(addressID)
            .set({
          'name': nameController.text,
          'phone': phoneController.text,
          'streetAddress': streetAddressController.text,
          'postalCode': postalCodeController.text,
          'city': cityController.text,
          'addressType': addressType[addressSelectedIndex.value],
          'addressTypeIndex': addressSelectedIndex.value,
        }, SetOptions(merge: true)).then((value) {
          VxToast.show(
            context,
            msg: 'Shipping address updated!',
            bgColor: redColor,
            textColor: whiteColor,
            position: VxToastPosition.center,
          );

          clearController();

          dismissLoading();

          /// BACK TO PREVIOUS SCREEN
          Get.back();
        });
      } else {
        ShippingAddress shippingAddress = ShippingAddress(
          name: nameController.text,
          phone: phoneController.text,
          streetAddress: streetAddressController.text,
          postalCode: postalCodeController.text,
          city: cityController.text,
          addressType: addressType[addressSelectedIndex.value],
          addressTypeIndex: addressSelectedIndex.value,
        );

        await firebaseFirestore
            .collection(userCollection)
            .doc(auth.currentUser!.uid)
            .collection(deliveryAddressCollection)
            .doc()
            .set(shippingAddress.toMap())
            .then((value) {
          VxToast.show(
            context,
            msg: 'Shipping address added!',
            bgColor: redColor,
            textColor: whiteColor,
            position: VxToastPosition.center,
          );

          clearController();

          dismissLoading();

          /// BACK TO PREVIOUS SCREEN
          Get.back();
        });
      }
    }
  }

  deleteDeliveryAddress({required String deliveryAddressID}) {
    firebaseFirestore
        .collection(userCollection)
        .doc(auth.currentUser!.uid)
        .collection(deliveryAddressCollection)
        .doc(deliveryAddressID)
        .delete();
  }

  getProductDetails() {
    for (var i = 0; i < productSnapshot.length; i++) {
      products.add({
        'p_ID': productSnapshot[i]['p_ID'],
        'p_name': productSnapshot[i]['p_name'],
        'p_image': productSnapshot[i]['p_image'],
        'quantity': productSnapshot[i]['quantity'],
        'color': productSnapshot[i]['color'],
        'p_sellerID': productSnapshot[i]['p_sellerID'],
      });
    }
  }

  placeOrder({
    required int paymentMethod,
    required double totalAmount,
  }) async {
    await getProductDetails();

    await firebaseFirestore.collection(orderCollection).doc().set({
      'order_number': '#44404442',
      'order_date': FieldValue.serverTimestamp(),
      'order_by': auth.currentUser!.uid,
      'order_user_name': Get.find<HomeController>().userName,
      'order_user_email': auth.currentUser!.email,
      'order_user_address': streetAddressController.text,
      'order_user_city': cityController.text,
      'order_user_phone': phoneController.text,
      'order_user_postal_code': postalCodeController.text,
      'order_shipping_method': 'Home Delivery',
      'order_payment_method': paymentMethod,
      'order_placed': true,
      'order_total_amount': totalAmount,
      'orders': FieldValue.arrayUnion(products),
    });
  }

  void clearController() {
    nameController.clear();
    phoneController.clear();
    streetAddressController.clear();
    postalCodeController.clear();
    cityController.clear();
    addressSelectedIndex.value = 0;
  }

  Future showLoading(context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Container(
          color: Colors.transparent,
          child: const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      },
    );
  }

  void dismissLoading() {
    Get.back();
  }
}
