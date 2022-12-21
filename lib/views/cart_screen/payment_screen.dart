import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/controllers/controllers.dart';
import 'package:flutter_e_mart/widgets/widgets.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: const CustomAppBarWidget(
        title: 'Choose Payment Method',
        textColor: darkFontGrey,
        fontFamily: semibold,
        elevation: 2,
        backgroundColor: whiteColor,
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
      body: Padding(
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
                            color:
                                controller.paymentSelectedIndex.value == index
                                    ? Colors.green
                                    : whiteColor,
                            width: 2,
                          ),
                          image: DecorationImage(
                            image: AssetImage(paymentMethodImageList[index]),
                            fit: BoxFit.cover,
                            colorFilter:
                                controller.paymentSelectedIndex.value == index
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
                        controller.paymentSelectedIndex.value = index;
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
                                borderRadius: BorderRadius.circular(12),
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
    );
  }
}
