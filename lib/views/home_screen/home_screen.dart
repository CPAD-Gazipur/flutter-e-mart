import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/views/home_screen/components/featured_button.dart';
import 'package:flutter_e_mart/widgets/custom_home_button.dart';
import 'package:flutter_rating_native/flutter_rating_native.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12),
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: Column(
          children: [
            /// Search Design
            Container(
              alignment: Alignment.center,
              height: 60,
              padding: const EdgeInsets.all(12),
              color: lightGrey,
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: whiteColor,
                  hintText: searchAnything,
                  hintStyle: TextStyle(
                    color: textFieldGrey,
                  ),
                ),
              ),
            ),

            /// Full Body
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    /// First Image Slider
                    VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: 130,
                      enlargeCenterPage: true,
                      itemCount: sliderList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: AssetImage(
                                sliderList[index],
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    ),
                    10.heightBox,

                    /// Today's Deal & Flash Sale
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        2,
                        (index) => customHomeButton(
                          onPressed: () {},
                          height: context.screenHeight * 0.15,
                          width: context.screenWidth / 2.5,
                          image: index == 0 ? icTodaysDeal : icFlashDeal,
                          title: index == 0 ? todaySDeal : flashSale,
                        ),
                      ),
                    ),
                    10.heightBox,

                    /// Second Image Slider
                    VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: 130,
                      enlargeCenterPage: true,
                      itemCount: secondSliderList.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          secondSliderList[index],
                          fit: BoxFit.fill,
                        )
                            .box
                            .roundedSM
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.symmetric(horizontal: 5))
                            .make();
                      },
                    ),
                    10.heightBox,

                    /// Top Categories Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        3,
                        (index) => customHomeButton(
                          onPressed: () {
                            debugPrint('Category Click');
                          },
                          height: context.screenHeight * 0.13,
                          width: context.screenWidth / 3.4,
                          image: index == 0
                              ? icTopCategories
                              : index == 1
                                  ? icBrands
                                  : icTopSeller,
                          title: index == 0
                              ? topCategories
                              : index == 1
                                  ? brand
                                  : topSeller,
                        ),
                      ),
                    ),
                    20.heightBox,

                    /// Featured Categories
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: featuredCategories.text
                                .color(darkFontGrey)
                                .fontFamily(semibold)
                                .size(18)
                                .make(),
                          ),
                          20.heightBox,
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                featuredImageList1.length,
                                (index) => Column(
                                  children: [
                                    featuredButton(
                                      featureImage: featuredImageList1[index],
                                      featureTitle: featuredTitleList1[index],
                                      onPressed: () {},
                                    ),
                                    10.heightBox,
                                    featuredButton(
                                      featureImage: featuredImageList2[index],
                                      featureTitle: featuredTitleList2[index],
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    20.heightBox,

                    /// Featured Products
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: redColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          featuredProducts.text.white
                              .fontFamily(bold)
                              .size(18)
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
                                    .margin(
                                      const EdgeInsets.symmetric(
                                        horizontal: 4.0,
                                      ),
                                    )
                                    .padding(const EdgeInsets.all(8.0))
                                    .make(),
                              ),
                            ),
                          ),
                          5.heightBox,
                        ],
                      ),
                    ),
                    20.heightBox,

                    /// Third Image Slider
                    VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: 130,
                      enlargeCenterPage: true,
                      itemCount: secondSliderList.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          secondSliderList[index],
                          fit: BoxFit.fill,
                        )
                            .box
                            .roundedSM
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.symmetric(horizontal: 5))
                            .make();
                      },
                    ),
                    20.heightBox,

                    /// All Product Section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 6.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: allProducts.text
                                  .color(fontGrey)
                                  .fontFamily(regular)
                                  .size(16)
                                  .make(),
                            ),
                          ),
                          10.heightBox,
                          GridView.builder(
                            shrinkWrap: true,
                            itemCount: 6,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              mainAxisExtent: 280,
                            ),
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Image.asset(
                                        imgP3,
                                        //fit: BoxFit.fill,
                                        width: 200,
                                        // height: 200,
                                      )
                                          .box
                                          .margin(
                                            const EdgeInsets.symmetric(
                                              horizontal: 4.0,
                                            ),
                                          )
                                          .make(),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Stack(
                                          children: [
                                            '${100 - (1200 * 100) ~/ 1450}%'
                                                .text
                                                .size(12)
                                                .fontFamily(semibold)
                                                .white
                                                .make()
                                                .box
                                                .color(redColor)
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      'Macbook Pro M1 Chip'
                                          .text
                                          .fontFamily(semibold)
                                          .maxLines(2)
                                          .ellipsis
                                          .color(darkFontGrey)
                                          .make(),
                                      5.heightBox,
                                      'Apple'
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
                                          '\$1200'
                                              .text
                                              .fontFamily(bold)
                                              .color(redColor)
                                              .size(14)
                                              .make(),
                                          5.widthBox,
                                          '\$1450'
                                              .text
                                              .fontFamily(regular)
                                              .color(fontGrey)
                                              .size(12)
                                              .lineThrough
                                              .make(),
                                        ],
                                      ),
                                      5.heightBox,
                                      Row(
                                        children: [
                                          const FlutterRating(
                                            rating: 3.7,
                                            starCount: 5,
                                            size: 14,
                                            borderColor: Colors.amber,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            allowHalfRating: true,
                                          ),
                                          5.widthBox,
                                          Expanded(
                                            child: '(10)'
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
                              )
                                  .box
                                  .white
                                  .roundedSM
                                  .outerShadowSm
                                  .clip(Clip.antiAlias)
                                  .make();
                            },
                          ),
                        ],
                      ),
                    ),
                    10.heightBox,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
