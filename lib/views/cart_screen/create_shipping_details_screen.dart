import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/controllers/cart_controller.dart';
import 'package:flutter_e_mart/widgets/widgets.dart';
import 'package:get/get.dart';

class CreateShippingDetailsScreen extends StatelessWidget {
  final dynamic deliveryDetails;
  const CreateShippingDetailsScreen({Key? key, this.deliveryDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();

    if (deliveryDetails != null) {
      controller.nameController.text = deliveryDetails.get('name').toString();
      controller.phoneController.text = deliveryDetails.get('phone').toString();
      controller.streetAddressController.text =
          deliveryDetails.get('street_address').toString();
      controller.postalCodeController.text =
          deliveryDetails.get('postal_code').toString();
      controller.cityController.text = deliveryDetails.get('city').toString();
      controller.addressSelectedIndex.value =
          deliveryDetails.get('address_type_index');
    }

    return backgroundWidget(
      child: Scaffold(
        appBar: CustomAppBarWidget(
          title: deliveryDetails != null
              ? 'Update Shipping Address'
              : 'Add Shipping Address',
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
                'Address Type'
                    .text
                    .color(redColor)
                    .fontFamily(semibold)
                    .size(14)
                    .make(),
                Obx(
                  () => Column(
                    children: [
                      RadioListTile(
                        value: addressType[0],
                        groupValue:
                            addressType[controller.addressSelectedIndex.value],
                        onChanged: (value) {
                          controller.addressSelectedIndex.value = 0;
                        },
                        activeColor: redColor,
                        title: const Text(
                          'Home',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: darkFontGrey,
                          ),
                        ),
                        secondary: const Icon(
                          Icons.home,
                          color: darkFontGrey,
                        ),
                      ),
                      RadioListTile(
                        value: addressType[1],
                        groupValue:
                            addressType[controller.addressSelectedIndex.value],
                        activeColor: redColor,
                        onChanged: (value) {
                          controller.addressSelectedIndex.value = 1;
                        },
                        title: const Text(
                          'Office',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: darkFontGrey,
                          ),
                        ),
                        secondary: const Icon(
                          Icons.work,
                          color: darkFontGrey,
                        ),
                      ),
                      RadioListTile(
                        value: addressType[2],
                        groupValue:
                            addressType[controller.addressSelectedIndex.value],
                        onChanged: (value) {
                          controller.addressSelectedIndex.value = 2;
                        },
                        activeColor: redColor,
                        title: const Text(
                          'Other',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: darkFontGrey,
                          ),
                        ),
                        secondary: const Icon(
                          Icons.home_work_rounded,
                          color: darkFontGrey,
                        ),
                      ),
                    ],
                  ),
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
            child: Obx(
              () => controller.isLoading.value
                  ? loadingIndicator()
                  : CustomButtonWidget(
                      title: deliveryDetails != null
                          ? 'Update Address'
                          : 'Save Address',
                      titleColor: whiteColor,
                      backgroundColor: redColor,
                      onPressed: () {
                        controller.saveOrUpdateShippingAddress(
                          context: context,
                          isUpdate: deliveryDetails != null ? true : false,
                          addressID: deliveryDetails.id,
                        );
                      },
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
