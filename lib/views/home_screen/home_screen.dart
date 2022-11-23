import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/views/home_screen/components/featured_button.dart';
import 'package:flutter_e_mart/widgets/custom_home_button.dart';

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
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
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
                    )
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
