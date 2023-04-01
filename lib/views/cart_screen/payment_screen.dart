import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/controllers/controllers.dart';
import 'package:flutter_e_mart/widgets/widgets.dart';
import 'package:get/get.dart';

import 'components/delivery_details.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();

    return backgroundWidget(
      child: Scaffold(
        appBar: const CustomAppBarWidget(
          title: 'Choose Payment Method',
          fontFamily: semibold,
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
              title: 'Place Order',
              titleColor: whiteColor,
              backgroundColor: redColor,
              onPressed: () {},
            ),
          ),
        ),
        body: Column(
          children: [
            const ListTile(
              title: Text(
                'Payment Methods',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: whiteColor,
                ),
              ),
              leading: Icon(
                Icons.payments_rounded,
                color: whiteColor,
                size: 25,
              ),
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Obx(
                      () => Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(
                          paymentMethodList.length,
                          (index) => Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 55,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        style: BorderStyle.solid,
                                        color: controller.paymentSelectedIndex
                                                    .value ==
                                                index
                                            ? Colors.green
                                            : whiteColor,
                                        width: 2,
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          paymentMethodImageList[index],
                                        ),
                                        fit: BoxFit.cover,
                                        colorFilter: controller
                                                    .paymentSelectedIndex
                                                    .value ==
                                                index
                                            ? ColorFilter.mode(
                                                Colors.black.withOpacity(0.2),
                                                BlendMode.darken,
                                              )
                                            : null,
                                      ),
                                    ),
                                  )
                                      .box
                                      .outerShadowSm
                                      .roundedSM
                                      .clip(Clip.antiAlias)
                                      .make()
                                      .onTap(() {
                                    controller.changePaymentIndex(
                                      index: index,
                                    );
                                  }),
                                  5.heightBox,
                                  Text(
                                    paymentMethodList[index],
                                    style: const TextStyle(fontSize: 10),
                                  )
                                ],
                              ),
                              controller.paymentSelectedIndex.value == index
                                  ? Transform.scale(
                                      scale: 0.8,
                                      child: SizedBox(
                                        height: 28,
                                        width: 28,
                                        child: Checkbox(
                                          activeColor: Colors.green,
                                          checkColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          value: true,
                                          onChanged: (value) {},
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(
                          height: 1,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 10),
                        'Payment Details'
                            .text
                            .size(16)
                            .make()
                            .box
                            .padding(
                              const EdgeInsets.symmetric(
                                horizontal: 2,
                              ),
                            )
                            .make(),
                        const SizedBox(height: 16),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                'Total'
                                    .text
                                    .color(darkFontGrey)
                                    .fontFamily(semibold)
                                    .make(),
                                '${controller.productSnapshot.length} item(s)'
                                    .toString()
                                    .text
                                    .fontFamily(bold)
                                    .color(redColor)
                                    .size(14)
                                    .make(),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                'Total Price'
                                    .text
                                    .color(darkFontGrey)
                                    .fontFamily(semibold)
                                    .make(),
                                Row(
                                  children: [
                                    '\$'
                                        .text
                                        .fontFamily(bold)
                                        .color(redColor)
                                        .size(14)
                                        .make(),
                                    '${controller.cartTotalPrice}'
                                        .toString()
                                        .numCurrency
                                        .text
                                        .fontFamily(bold)
                                        .color(redColor)
                                        .size(14)
                                        .make(),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )
                            .box
                            .padding(const EdgeInsets.all(12))
                            .width(context.screenWidth - 20)
                            .roundedSM
                            .outerShadowSm
                            .color(lightGolden)
                            .make(),
                        const SizedBox(height: 20),
                        const Divider(
                          height: 1,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 10),
                        'Delivery Address'
                            .text
                            .size(16)
                            .make()
                            .box
                            .padding(
                              const EdgeInsets.symmetric(
                                horizontal: 2,
                              ),
                            )
                            .make(),
                        const SizedBox(height: 16),
                        DeliveryDetails(
                          deliveryAddressDetails: controller.deliveryAddress,
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
