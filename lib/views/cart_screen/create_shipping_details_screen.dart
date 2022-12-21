import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/controllers/cart_controller.dart';
import 'package:flutter_e_mart/widgets/widgets.dart';
import 'package:get/get.dart';

class CreateShippingDetailsScreen extends StatelessWidget {
  const CreateShippingDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CustomAppBarWidget(
        title: 'Add Shipping Address',
        textColor: darkFontGrey,
        fontFamily: semibold,
        elevation: 2,
        backgroundColor: whiteColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
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
          ),
        ),
      ),
      bottomNavigationBar: CustomButtonWidget(
        title: 'Save Address',
        titleColor: whiteColor,
        backgroundColor: redColor,
        onPressed: () {},
      ),
    );
  }
}
