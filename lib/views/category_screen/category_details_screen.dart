import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/widgets/background_widget.dart';
import 'package:flutter_rating_native/flutter_rating_native.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final String title;
  const CategoryDetailsScreen({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return backgroundWidget(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: title.text.fontFamily(bold).white.make(),
          centerTitle: false,
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(
                    6,
                    (index) => 'Women Clothing'
                        .text
                        .size(12)
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .makeCentered()
                        .box
                        .white
                        .roundedSM
                        .size(130, 50)
                        .margin(const EdgeInsets.symmetric(horizontal: 4))
                        .make(),
                  ),
                ),
              ),
              10.heightBox,

              /// CATEGORY PRODUCT LIST
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 6,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  allowHalfRating: true,
                                ),
                                5.widthBox,
                                Expanded(
                                  child: '(10)'.text.size(10).ellipsis.make(),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
