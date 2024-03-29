import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/controllers/controllers.dart';
import 'package:flutter_e_mart/services/firestore_services.dart';
import 'package:flutter_e_mart/views/views.dart';
import 'package:flutter_e_mart/widgets/widgets.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProductController());
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
                          StreamBuilder<QuerySnapshot>(
                            stream: FirestoreServices.getAllProducts(),
                            builder: (
                              BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot,
                            ) {
                              if (!snapshot.hasData) {
                                return loadingIndicator();
                              } else if (snapshot.data!.docs.isEmpty) {
                                return 'No Data Found'.text.make();
                              } else {
                                var data = snapshot.data!.docs;

                                return GridView.builder(
                                  shrinkWrap: true,
                                  itemCount: data.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 8,
                                    mainAxisExtent: 282,
                                  ),
                                  itemBuilder: (context, index) {
                                    return ProductShortDetails(
                                      productDetails: data[index],
                                    );
                                  },
                                );
                              }
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
