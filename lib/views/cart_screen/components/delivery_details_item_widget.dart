import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/controllers/cart_controller.dart';
import 'package:get/get.dart';

class DeliveryDetailsItemWidget extends StatelessWidget {
  final dynamic deliveryAddressDetails;
  final int index;

  const DeliveryDetailsItemWidget({
    Key? key,
    required this.deliveryAddressDetails,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();

    return Obx(
      () => Column(
        children: [
          const Divider(),
          RadioListTile(
            value: index,
            groupValue: controller.deliveryAddressSelectedIndex.value,
            onChanged: (newValue) {
              controller.deliveryAddressSelectedIndex.value = newValue!;
            },
            activeColor: redColor,
            visualDensity: const VisualDensity(
              horizontal: -4,
              vertical: -4,
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${deliveryAddressDetails.get('name')}',
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    color: darkFontGrey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 5,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    color:
                        controller.deliveryAddressSelectedIndex.value == index
                            ? redColor
                            : Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Center(
                    child: Text(
                      '${deliveryAddressDetails.get('address_type')}'
                          .toUpperCase(),
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        color: whiteColor,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 5),
                Text(
                  '${deliveryAddressDetails.get('street_address')} - ${deliveryAddressDetails.get('postal_code')}, ${deliveryAddressDetails.get('city')}',
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    color: darkFontGrey,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${deliveryAddressDetails.get('phone')}',
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        color: darkFontGrey,
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            deleteDeliveryAddress(context);
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.delete,
                              size: 18,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.edit,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
              .box
              .color(
                controller.deliveryAddressSelectedIndex.value == index
                    ? Colors.grey.shade100
                    : whiteColor,
              )
              .margin(
                const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
              )
              .roundedSM
              .make(),
          const Divider(),
        ],
      ),
    );
  }

  void deleteDeliveryAddress(
    BuildContext context,
  ) {
    AlertDialog alert = AlertDialog(
      title: const Text(
        'Warning!!!',
        style: TextStyle(
          fontFamily: 'Roboto',
          color: Colors.red,
        ),
      ),
      content: const Text('Are you sure to delete address?'),
      actions: [
        TextButton(
          child: const Text(
            'Yes',
            style: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.grey,
            ),
          ),
          onPressed: () {
            Get.back();
            Get.find<CartController>().deleteDeliveryAddress(
              deliveryAddressID: deliveryAddressDetails.id,
            );
          },
        ),
        TextButton(
          child: const Text(
            'No',
            style: TextStyle(
              fontFamily: 'Roboto',
              color: darkFontGrey,
            ),
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
