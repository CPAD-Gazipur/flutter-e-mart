import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_e_mart/controllers/controllers.dart';
import 'package:flutter_e_mart/models/shipping_address.dart';
import 'package:flutter_e_mart/services/firestore_services.dart';
import 'package:flutter_e_mart/views/cart_screen/create_shipping_details_screen.dart';
import 'package:flutter_e_mart/views/views.dart';
import 'package:flutter_e_mart/widgets/widgets.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';
import 'components/delivery_details_item_widget.dart';

class ShippingDetailsScreen extends StatelessWidget {
  const ShippingDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();

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
                if (controller.deliveryAddress != null) {
                  Get.to(() => const PaymentScreen());
                } else {
                  VxToast.show(
                    context,
                    msg: 'Please select delivery address',
                    bgColor: redColor,
                    textColor: whiteColor,
                    position: VxToastPosition.center,
                  );
                }
              },
            ),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirestoreServices.getShippingAddresses(),
          builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot,
          ) {
            if (!snapshot.hasData) {
              controller.deliveryAddress = null;
              return loadingIndicator();
            } else if (snapshot.data!.docs.isEmpty) {
              controller.deliveryAddress = null;
              return Center(
                child: 'Shipping address is empty'.text.make(),
              );
            } else {
              var data = snapshot.data!.docs;

              if (data.length >= controller.addressSelectedIndex.value) {
                DocumentSnapshot addressSnapshot =
                    data[controller.addressSelectedIndex.value];

                controller.deliveryAddress = ShippingAddress.fromMap(
                    addressSnapshot.data() as Map<String, dynamic>);
              } else {
                DocumentSnapshot addressSnapshot = data[0];

                controller.deliveryAddress = ShippingAddress.fromMap(
                    addressSnapshot.data() as Map<String, dynamic>);
              }

              return Column(
                children: [
                  ListTile(
                    title: const Text(
                      'Delivery To',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: whiteColor,
                      ),
                    ),
                    leading: Image.asset(
                      'assets/images/location_icon.png',
                      color: whiteColor,
                      height: 30,
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: whiteColor,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return DeliveryDetailsItemWidget(
                        index: index,
                        controller: controller,
                        deliveryAddressDetails: ShippingAddress.fromMap(
                            data[index].data() as Map<String, dynamic>),
                      );
                    },
                  ).box.white.make(),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
