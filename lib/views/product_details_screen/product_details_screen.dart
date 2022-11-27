import 'package:flutter_e_mart/widgets/custom_button_widget.dart';
import 'package:flutter_rating_native/flutter_rating_native.dart';

import '../../consts/consts.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String title;
  final String image;

  const ProductDetailsScreen({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        title: title.text
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
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// PRODUCT IMAGE SLIDER
                    VxSwiper.builder(
                      itemCount: 3,
                      autoPlay: true,
                      height: 260,
                      aspectRatio: 16 / 8,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          image,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                    10.heightBox,

                    /// PRODUCT DETAILS
                    title.text
                        .size(18)
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .make(),
                    5.heightBox,
                    Row(
                      children: [
                        const FlutterRating(
                          size: 20,
                          rating: 3.5,
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
                              '-  3.5 Rating'
                                  .text
                                  .size(14)
                                  .ellipsis
                                  .fontFamily(semibold)
                                  .make(),
                              5.widthBox,
                              '(10 reviews)'
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
                        '\$1200'
                            .text
                            .fontFamily(bold)
                            .color(redColor)
                            .size(16)
                            .make(),
                        5.widthBox,
                        '\$1450'
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
                              'In House Brands'
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
                          debugPrint('Message Clicked');
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
                    Column(
                      children: [
                        /// Color Choose
                        10.heightBox,
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: 'Color:'.text.color(textFieldGrey).make(),
                            ),
                            Row(
                              children: List.generate(
                                3,
                                (index) => VxBox()
                                    .size(40, 40)
                                    .roundedFull
                                    .color(Vx.randomPrimaryColor)
                                    .margin(
                                      const EdgeInsets.symmetric(
                                        horizontal: 4,
                                      ),
                                    )
                                    .make(),
                              ),
                            )
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),
                        10.heightBox,

                        /// Quantity
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child:
                                  'Quantity:'.text.color(textFieldGrey).make(),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove),
                                ),
                                '0'
                                    .text
                                    .size(16)
                                    .color(darkFontGrey)
                                    .fontFamily(bold)
                                    .make(),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add),
                                ),
                                10.widthBox,
                                '(0 available)'
                                    .text
                                    .color(textFieldGrey)
                                    .make(),
                              ],
                            )
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),
                        10.heightBox,

                        /// Total Price
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: 'Total:'.text.color(textFieldGrey).make(),
                            ),
                            '\$1200.00'
                                .text
                                .size(16)
                                .color(redColor)
                                .fontFamily(bold)
                                .make(),
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),
                        10.heightBox,
                      ],
                    )
                        .box
                        .white
                        .roundedSM
                        .outerShadow
                        .margin(const EdgeInsets.symmetric(horizontal: 2))
                        .make(),
                    20.heightBox,

                    /// Product Description
                    description.text
                        .size(18)
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .make(),
                    10.heightBox,
                    productDescription.text
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
                  ],
                ),
              ),
            ),
          ),

          /// ADD TO CART BUTTON
          SizedBox(
            width: double.infinity,
            height: 60,
            child: CustomButtonWidget(
              title: 'Add To Cart',
              titleColor: whiteColor,
              backgroundColor: redColor,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
