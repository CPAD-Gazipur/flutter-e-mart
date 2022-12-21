import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/controllers/cart_controller.dart';
import 'package:flutter_e_mart/widgets/widgets.dart';
import 'package:get/get.dart';

class CreateShippingDetailsScreen extends StatelessWidget {
  const CreateShippingDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();

    return backgroundWidget(
      child: Scaffold(
        appBar: const CustomAppBarWidget(
          title: 'Add Shipping Address',
          fontFamily: semibold,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                customTextFormFieldWidget(
                  controller: controller.nameController,
                  label: 'Name',
                  hintText: 'Ex. Md. Al-Amin',
                  keyboardType: TextInputType.name,
                ),
                customTextFormFieldWidget(
                  controller: controller.phoneController,
                  label: 'Phone',
                  hintText: 'Ex. +88017******',
                  keyboardType: TextInputType.phone,
                ),
                customTextFormFieldWidget(
                  controller: controller.streetAddressController,
                  label: 'Street Address',
                  hintText: 'Ex. 24/4 Road, 7 No Sector, Uttara',
                  keyboardType: TextInputType.streetAddress,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 16,
                  ),
                ),
                customTextFormFieldWidget(
                  controller: controller.postalCodeController,
                  label: 'Postal Code',
                  hintText: 'Ex. 1700',
                  keyboardType: TextInputType.number,
                ),
                customTextFormFieldWidget(
                  controller: controller.cityController,
                  label: 'City',
                  hintText: 'Ex. Dhaka',
                  keyboardType: TextInputType.text,
                ),
              ],
            )
                .box
                .white
                .outerShadowSm
                .padding(const EdgeInsets.all(12))
                .roundedSM
                .make(),
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            bottom: 10,
          ),
          child: Hero(
            tag: 'custom_button_float',
            child: CustomButtonWidget(
              title: 'Save Address',
              titleColor: whiteColor,
              backgroundColor: redColor,
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
