import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_e_mart/controllers/controllers.dart';
import 'package:flutter_e_mart/views/chat_screen/chat_screen.dart';
import 'package:flutter_e_mart/widgets/widgets.dart';
import 'package:flutter_rating_native/flutter_rating_native.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../consts/consts.dart';

class ProductDetailsScreen extends StatelessWidget {
  final dynamic productDetails;

  const ProductDetailsScreen({
    Key? key,
    required this.productDetails,
  }) : super(key: key);

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(
      viewportFraction: 1,
      initialPage: 0,
    );

    var productController = Get.find<ProductController>();

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        title: '${productDetails['p_name']}'
            .text
            .maxLines(1)
            .fontFamily(bold)
            .ellipsis
            .color(darkFontGrey)
            .make(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_outline,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// PRODUCT IMAGE SLIDER
                    SizedBox(
                      height: 240,
                      child: PageView.builder(
                        itemCount: productDetails['p_images'].length,
                        controller: pageController,
                        onPageChanged: (value) {
                          productController.currentImageIndex.value = value;
                        },
                        itemBuilder: (context, index) {
                          return CachedNetworkImage(
                            imageUrl: productDetails['p_images'][index],
                            imageBuilder: (context, imageProvider) => Container(
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
                            placeholder: (context, url) => Shimmer.fromColors(
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
                            errorWidget: (context, url, error) => Image.asset(
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
                          )
                              .box
                              .roundedSM
                              .padding(const EdgeInsets.all(10))
                              .clip(Clip.antiAlias)
                              .make()
                              .onTap(
                            () {
                              debugPrint('VIEW FULL IMAGE');
                            },
                          );
                        },
                      ),
                    ),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: map(
                          productDetails['p_images'],
                          (index, url) {
                            return Container(
                              width: 10,
                              height: 10,
                              margin: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 2.0,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black54),
                                shape: BoxShape.circle,
                                color:
                                    productController.currentImageIndex.value ==
                                            index
                                        ? Colors.black54
                                        : const Color.fromRGBO(
                                            255,
                                            255,
                                            255,
                                            0.4,
                                          ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    10.heightBox,

                    /// PRODUCT DETAILS
                    '${productDetails['p_name']}'
                        .text
                        .size(18)
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .make(),
                    5.heightBox,
                    '${productDetails['p_brand']}'
                        .text
                        .fontFamily(regular)
                        .color(fontGrey)
                        .size(14)
                        .maxLines(1)
                        .ellipsis
                        .make(),
                    5.heightBox,
                    Row(
                      children: [
                        FlutterRating(
                          size: 20,
                          rating: double.parse(productDetails['p_rating']),
                          borderColor: Colors.amber,
                          color: golden,
                          allowHalfRating: true,
                          starCount: 5,
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                        5.widthBox,
                        Expanded(
                          child: Row(
                            children: [
                              '-  ${double.parse(productDetails['p_rating'])} Rating'
                                  .text
                                  .size(14)
                                  .ellipsis
                                  .fontFamily(semibold)
                                  .make(),
                              5.widthBox,
                              '(${productDetails['p_review']} reviews)'
                                  .text
                                  .size(12)
                                  .ellipsis
                                  .fontFamily(regular)
                                  .make(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    10.heightBox,
                    Row(
                      children: [
                        '\$${productDetails['p_sellPrice'].toString().replaceAllMapped(
                                  RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                  (Match m) => '${m[1]},',
                                )}'
                            .text
                            .fontFamily(bold)
                            .color(redColor)
                            .size(16)
                            .make(),
                        5.widthBox,
                        '\$${productDetails['p_price'].toString().replaceAllMapped(
                                  RegExp(r"(\d{1,3})(?=(\d{3})+(?!\d))"),
                                  (Match m) => '${m[1]},',
                                )}'
                            .text
                            .fontFamily(regular)
                            .color(fontGrey)
                            .size(14)
                            .lineThrough
                            .make(),
                      ],
                    ),
                    10.heightBox,

                    /// Seller Info
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              'Seller'
                                  .text
                                  .white
                                  .fontFamily(semibold)
                                  .size(14)
                                  .make(),
                              5.heightBox,
                              '${productDetails['p_seller']}'
                                  .text
                                  .fontFamily(regular)
                                  .size(14)
                                  .color(darkFontGrey)
                                  .make(),
                            ],
                          ),
                        ),
                        const CircleAvatar(
                          backgroundColor: whiteColor,
                          child: Icon(
                            Icons.message_outlined,
                            color: darkFontGrey,
                          ),
                        ).onTap(() {
                          Get.to(
                            () => const ChatScreen(),
                            arguments: [
                              '${productDetails['p_seller']}',
                              '${productDetails['p_sellerID']}',
                            ],
                          );
                        }),
                      ],
                    )
                        .box
                        .height(60)
                        .color(textFieldGrey)
                        .roundedSM
                        .outerShadowSm
                        .margin(const EdgeInsets.symmetric(horizontal: 2))
                        .padding(const EdgeInsets.symmetric(horizontal: 16))
                        .make(),
                    20.heightBox,

                    /// Product Variation
                    Obx(
                      () => Column(
                        children: [
                          /// Color Choose
                          10.heightBox,
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child:
                                    'Color:'.text.color(textFieldGrey).make(),
                              ),
                              Row(
                                children: List.generate(
                                  productDetails['p_colors'].length,
                                  (index) => Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      VxBox()
                                          .size(40, 40)
                                          .roundedFull
                                          .color(
                                            Color(
                                              int.parse(
                                                productDetails['p_colors']
                                                    [index],
                                              ),
                                            ),
                                          )
                                          .margin(
                                            const EdgeInsets.symmetric(
                                              horizontal: 4,
                                            ),
                                          )
                                          .make()
                                          .onTap(() {
                                        productController
                                            .changeColorIndex(index);
                                      }),
                                      Visibility(
                                        visible: index ==
                                            productController
                                                .selectedColorIndex.value,
                                        child: const Icon(
                                          Icons.done,
                                          color: whiteColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                              .box
                              .padding(const EdgeInsets.all(8))
                              .margin(
                                const EdgeInsets.only(
                                  left: 10,
                                ),
                              )
                              .make(),
                          10.heightBox,

                          /// Quantity
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: 'Quantity:'
                                    .text
                                    .color(textFieldGrey)
                                    .make(),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      productController.decreaseQuantity();
                                      productController.calculateTotalPrice(
                                        price: double.parse(
                                          productDetails['p_sellPrice']
                                              .toString(),
                                        ),
                                      );
                                    },
                                    icon: const Icon(Icons.remove),
                                  ),
                                  '${productController.selectedQuantity.value}'
                                      .text
                                      .size(16)
                                      .color(darkFontGrey)
                                      .fontFamily(bold)
                                      .make(),
                                  IconButton(
                                    onPressed: () {
                                      productController.increaseQuantity(
                                        totalQuantity: int.parse(
                                          productDetails['p_quantity'],
                                        ),
                                      );
                                      productController.calculateTotalPrice(
                                        price: double.parse(
                                          productDetails['p_sellPrice']
                                              .toString(),
                                        ),
                                      );
                                    },
                                    icon: const Icon(Icons.add),
                                  ),
                                  10.widthBox,
                                  '(${productDetails['p_quantity']} available)'
                                      .text
                                      .color(textFieldGrey)
                                      .make(),
                                ],
                              )
                            ],
                          )
                              .box
                              .padding(const EdgeInsets.all(8))
                              .margin(
                                const EdgeInsets.only(
                                  left: 10,
                                ),
                              )
                              .make(),
                          10.heightBox,

                          /// Total Price
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child:
                                    'Total:'.text.color(textFieldGrey).make(),
                              ),
                              Row(
                                children: [
                                  '\$'
                                      .text
                                      .size(16)
                                      .color(redColor)
                                      .fontFamily(bold)
                                      .make(),
                                  '${productController.totalPrice.value}'
                                      .numCurrency
                                      .text
                                      .size(16)
                                      .color(redColor)
                                      .fontFamily(bold)
                                      .make(),
                                ],
                              ),
                            ],
                          )
                              .box
                              .padding(const EdgeInsets.all(8))
                              .margin(
                                const EdgeInsets.only(
                                  left: 10,
                                ),
                              )
                              .make(),
                          10.heightBox,
                        ],
                      )
                          .box
                          .white
                          .roundedSM
                          .outerShadow
                          .margin(const EdgeInsets.symmetric(horizontal: 2))
                          .make(),
                    ),

                    20.heightBox,

                    /// Product Description
                    description.text
                        .size(18)
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .make(),
                    10.heightBox,
                    '${productDetails['p_description']}'
                        .text
                        .color(darkFontGrey)
                        .justify
                        .make()
                        .box
                        .padding(
                          const EdgeInsets.symmetric(
                            horizontal: 2,
                          ),
                        )
                        .make(),
                    20.heightBox,

                    /// Product Detail Items
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(
                        productDetailsItemList.length,
                        (index) => ListTile(
                          title: productDetailsItemList[index]
                              .text
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .make(),
                          trailing: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 16,
                          ),
                        )
                            .box
                            .white
                            .roundedSM
                            .margin(
                              const EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 2,
                              ),
                            )
                            .outerShadow
                            .make(),
                      ),
                    ),
                    20.heightBox,

                    /// Similar Product
                    productYouMayAlsoLike.text
                        .size(18)
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .make(),
                    10.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          6,
                          (index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                imgP1,
                                width: 130,
                                fit: BoxFit.cover,
                              ),
                              10.heightBox,
                              'Laptop 8GB/64GB'
                                  .text
                                  .fontFamily(semibold)
                                  .color(darkFontGrey)
                                  .make(),
                              10.heightBox,
                              '\$600'
                                  .text
                                  .fontFamily(bold)
                                  .color(redColor)
                                  .size(14)
                                  .make(),
                            ],
                          )
                              .box
                              .white
                              .roundedSM
                              .outerShadow
                              .margin(
                                const EdgeInsets.symmetric(
                                  horizontal: 4.0,
                                  vertical: 4.0,
                                ),
                              )
                              .padding(const EdgeInsets.all(8.0))
                              .make(),
                        ),
                      ),
                    ),
                    10.heightBox,
                  ],
                ),
              ),
            ),
          ),

          /// ADD TO CART BUTTON
          SizedBox(
            width: double.infinity,
            height: 60,
            child: Obx(
              () => productController.isLoading.value
                  ? loadingIndicator()
                  : CustomButtonWidget(
                      title: 'Add To Cart',
                      titleColor: whiteColor,
                      backgroundColor: redColor,
                      onPressed: () {
                        productController.isLoading(true);

                        try {
                          productController.addToCart(
                            context: context,
                            pID: productDetails['p_ID'],
                            pTitle: productDetails['p_name'],
                            pImage: productDetails['p_images'][0],
                            seller: productDetails['p_seller'],
                            sellerID: productDetails['p_sellerID'],
                            totalPrice: productController.totalPrice.toString(),
                            pColor: productDetails['p_colors']
                                [productController.selectedColorIndex.value],
                            pQuantity: productController.selectedQuantity.value
                                .toString(),
                            buyerID: auth.currentUser!.uid,
                          );
                          VxToast.show(
                            context,
                            msg: 'Added To Cart',
                            textColor: whiteColor,
                            bgColor: redColor,
                          );
                          productController.isLoading(false);
                        } catch (e) {
                          VxToast.show(
                            context,
                            msg: e.toString(),
                            textColor: whiteColor,
                            bgColor: redColor,
                          );
                          productController.isLoading(false);
                        }
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
