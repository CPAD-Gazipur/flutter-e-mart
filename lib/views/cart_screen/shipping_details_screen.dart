import 'package:flutter_e_mart/views/cart_screen/create_shipping_details_screen.dart';
import 'package:flutter_e_mart/views/cart_screen/payment_screen.dart';
import 'package:flutter_e_mart/widgets/widgets.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';

class ShippingDetailsScreen extends StatelessWidget {
  const ShippingDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return backgroundWidget(
      child: Scaffold(
        appBar: const CustomAppBarWidget(
          title: 'Shipping Address',
          fontFamily: semibold,
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Add New Address',
          heroTag: 'custom_button_float',
          backgroundColor: redColor,
          child: const Icon(Icons.add),
          onPressed: () {
            Get.to(() => const CreateShippingDetailsScreen());
          },
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            bottom: 10,
          ),
          child: Hero(
            tag: 'custom_button',
            child: CustomButtonWidget(
              title: 'Next To Payment',
              titleColor: whiteColor,
              backgroundColor: redColor,
              onPressed: () {
                Get.to(() => const PaymentScreen());
              },
            ),
          ),
        ),
      ),
    );
  }
}
