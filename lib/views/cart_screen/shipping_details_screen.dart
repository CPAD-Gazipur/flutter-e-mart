import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_e_mart/services/firestore_services.dart';
import 'package:flutter_e_mart/views/cart_screen/create_shipping_details_screen.dart';
import 'package:flutter_e_mart/views/cart_screen/payment_screen.dart';
import 'package:flutter_e_mart/widgets/widgets.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';
import 'components/delivery_details_item_widget.dart';

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
        body: StreamBuilder<QuerySnapshot>(
          stream: FirestoreServices.getShippingAddresses(),
          builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot,
          ) {
            if (!snapshot.hasData) {
              return loadingIndicator();
            } else if (snapshot.data!.docs.isEmpty) {
              return Center(
                child: 'Shipping address is empty'.text.make(),
              );
            } else {
              var data = snapshot.data!.docs;

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
                        deliveryAddressDetails: data[index],
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
