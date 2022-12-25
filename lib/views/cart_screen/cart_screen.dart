import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/controllers/cart_controller.dart';
import 'package:flutter_e_mart/services/firestore_services.dart';
import 'package:flutter_e_mart/views/cart_screen/shipping_details_screen.dart';
import 'package:flutter_e_mart/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartController = Get.put(CartController());

    return backgroundWidget(
      child: Scaffold(
        //backgroundColor: whiteColor,
        appBar: const CustomAppBarWidget(
          title: 'Shopping Cart',
          showBackIcon: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 8.0,
          ),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirestoreServices.getCartedProducts(
              uID: auth.currentUser!.uid,
            ),
            builder: (
              BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot,
            ) {
              if (!snapshot.hasData) {
                return loadingIndicator();
              } else if (snapshot.data!.docs.isEmpty) {
                return Center(
                  child: 'Cart is empty'.text.make(),
                );
              } else {
                var data = snapshot.data!.docs;

                cartController.calculateCartedAllProductPrice(data: data);
                cartController.productSnapshot = data;

                return Column(
                  children: [
                    Expanded(
                      child: Scrollbar(
                        thumbVisibility: true,
                        thickness: 4,
                        trackVisibility: true,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            var cartProductDetails = data[index];
                            return ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 4.0,
                                vertical: 2.0,
                              ),
                              leading: SizedBox(
                                width: 80,
                                child: CachedNetworkImage(
                                  imageUrl: cartProductDetails['p_image'],
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: imageProvider,
                                      ),
                                    ),
                                  )
                                          .box
                                          .roundedSM
                                          .clip(Clip.antiAlias)
                                          .margin(
                                            const EdgeInsets.all(2.0),
                                          )
                                          .padding(const EdgeInsets.all(4.0))
                                          .make(),
                                  placeholder: (context, url) =>
                                      Shimmer.fromColors(
                                    baseColor: Colors.grey,
                                    highlightColor: Colors.white,
                                    child: Image.asset(
                                      'assets/images/placeholder_image.png',
                                    ),
                                  )
                                          .box
                                          .margin(
                                            const EdgeInsets.symmetric(
                                              horizontal: 4.0,
                                            ),
                                          )
                                          .roundedSM
                                          .clip(Clip.antiAlias)
                                          .make(),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    'assets/images/placeholder_image.png',
                                  )
                                          .box
                                          .margin(
                                            const EdgeInsets.symmetric(
                                              horizontal: 4.0,
                                            ),
                                          )
                                          .roundedSM
                                          .clip(Clip.antiAlias)
                                          .make(),
                                ).box.roundedSM.clip(Clip.antiAlias).make(),
                              ),
                              title:
                                  '${cartProductDetails['p_name']} - (x${cartProductDetails['quantity']})'
                                      .text
                                      .fontFamily(semibold)
                                      .size(14)
                                      .make(),
                              subtitle: Row(
                                children: [
                                  '\$'
                                      .text
                                      .fontFamily(semibold)
                                      .color(redColor)
                                      .make(),
                                  '${cartProductDetails['totalPrice']}'
                                      .text
                                      .fontFamily(semibold)
                                      .color(redColor)
                                      .make(),
                                ],
                              ),
                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: redColor,
                                ),
                                onPressed: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text(
                                        'Remove Cart Item',
                                        style: TextStyle(color: redColor),
                                      ),
                                      content: RichText(
                                        text: TextSpan(
                                            text: 'Want to remove ',
                                            style: const TextStyle(
                                              color: darkFontGrey,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            children: [
                                              TextSpan(
                                                text:
                                                    '${cartProductDetails['p_name']}',
                                                style: const TextStyle(
                                                  color: darkFontGrey,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              const TextSpan(
                                                text: ' from your cart ?',
                                                style: TextStyle(
                                                  color: darkFontGrey,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ]),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            FirestoreServices.removeCartItem(
                                              cartID: cartProductDetails.id,
                                            );
                                            Get.back();
                                          },
                                          child: const Text(
                                            'Yes',
                                            style: TextStyle(color: redColor),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: const Text('No'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            )
                                .box
                                .margin(
                                  const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 10,
                                  ),
                                )
                                .roundedSM
                                .color(lightGrey)
                                .make();
                          },
                        )
                            .box
                            .white
                            .outerShadow
                            .roundedSM
                            .padding(
                              const EdgeInsets.only(
                                top: 5.0,
                                bottom: 5.0,
                                right: 5.0,
                              ),
                            )
                            .clip(Clip.antiAlias)
                            .make(),
                      ),
                    ),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        'Total Price:'
                            .text
                            .color(darkFontGrey)
                            .fontFamily(semibold)
                            .make(),
                        Obx(
                          () => Row(
                            children: [
                              '\$'
                                  .text
                                  .fontFamily(bold)
                                  .color(redColor)
                                  .size(14)
                                  .make(),
                              '${cartController.cartTotalPrice}'
                                  .toString()
                                  .numCurrency
                                  .text
                                  .fontFamily(bold)
                                  .color(redColor)
                                  .size(14)
                                  .make(),
                            ],
                          ),
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
                    10.heightBox,
                    SizedBox(
                      width: context.screenWidth - 40,
                      child: Hero(
                        tag: 'custom_button',
                        child: CustomButtonWidget(
                          title: 'Proceed to Shipping',
                          titleColor: whiteColor,
                          backgroundColor: redColor,
                          onPressed: () {
                            cartController.deliveryAddressSelectedIndex.value =
                                0;
                            Get.to(() => const ShippingDetailsScreen());
                          },
                        ),
                      ),
                    )
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
