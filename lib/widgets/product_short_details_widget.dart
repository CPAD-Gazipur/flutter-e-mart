import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/controllers/controllers.dart';
import 'package:flutter_e_mart/views/views.dart';
import 'package:flutter_rating_native/flutter_rating_native.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ProductShortDetails extends StatelessWidget {
  final dynamic productDetails;
  const ProductShortDetails({Key? key, required this.productDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productController = Get.find<ProductController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            SizedBox(
              width: 200,
              height: 160,
              child: CachedNetworkImage(
                imageUrl: productDetails['p_images'][0],
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
              ).box.roundedSM.clip(Clip.antiAlias).make(),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Stack(
                children: [
                  '${100 - (double.parse(productDetails['p_sellPrice'].toString()) * 100) ~/ double.parse(productDetails['p_price'].toString())}%'
                      .text
                      .size(12)
                      .fontFamily(bold)
                      .white
                      .make()
                      .box
                      .color(redColor.withOpacity(0.8))
                      .padding(
                        const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                      )
                      .make(),
                ],
              ),
            ),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            '${productDetails['p_name']}'
                .text
                .fontFamily(semibold)
                .maxLines(2)
                .ellipsis
                .color(darkFontGrey)
                .make(),
            5.heightBox,
            '${productDetails['p_brand']}'
                .text
                .fontFamily(regular)
                .color(fontGrey)
                .size(12)
                .maxLines(1)
                .ellipsis
                .make(),
            10.heightBox,
            Row(
              children: [
                Row(
                  children: [
                    '\$'.text.fontFamily(bold).color(redColor).size(14).make(),
                    productDetails['p_sellPrice']
                        .toString()
                        .numCurrency
                        .text
                        .fontFamily(bold)
                        .color(redColor)
                        .size(14)
                        .make(),
                  ],
                ),
                8.widthBox,
                Row(
                  children: [
                    '\$'
                        .text
                        .fontFamily(regular)
                        .color(fontGrey)
                        .size(12)
                        .lineThrough
                        .make(),
                    productDetails['p_price']
                        .toString()
                        .numCurrency
                        .text
                        .fontFamily(regular)
                        .color(fontGrey)
                        .size(12)
                        .lineThrough
                        .make(),
                  ],
                )
              ],
            ),
            5.heightBox,
            Row(
              children: [
                FlutterRating(
                  rating: double.parse(productDetails['p_rating']),
                  starCount: 5,
                  size: 14,
                  borderColor: Colors.amber,
                  mainAxisAlignment: MainAxisAlignment.start,
                  allowHalfRating: true,
                ),
                5.widthBox,
                Expanded(
                  child: '(${productDetails['p_review']})'
                      .text
                      .size(10)
                      .ellipsis
                      .make(),
                ),
              ],
            ),
          ],
        )
            .box
            .margin(
              const EdgeInsets.symmetric(
                horizontal: 4.0,
              ),
            )
            .padding(
              const EdgeInsets.only(
                left: 12,
                right: 12,
                bottom: 12,
              ),
            )
            .make(),
      ],
    ).box.white.roundedSM.outerShadowSm.clip(Clip.antiAlias).make().onTap(
      () {
        productController.currentImageIndex.value = 0;
        productController.selectedColorIndex.value = 0;
        productController.selectedQuantity.value = 1;
        productController.calculateTotalPrice(
          price: double.parse(
            productDetails['p_sellPrice'].toString(),
          ),
        );
        Get.to(
          () => ProductDetailsScreen(
            productDetails: productDetails,
          ),
        );
      },
    );
  }
}
