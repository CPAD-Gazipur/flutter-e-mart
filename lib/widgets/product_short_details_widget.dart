import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/views/views.dart';
import 'package:flutter_rating_native/flutter_rating_native.dart';
import 'package:get/get.dart';

class ProductShortDetails extends StatelessWidget {
  const ProductShortDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                '\$1200'.text.fontFamily(bold).color(redColor).size(14).make(),
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
    ).box.white.roundedSM.outerShadowSm.clip(Clip.antiAlias).make().onTap(
          () => Get.to(
            () => const ProductDetailsScreen(
              title: 'Macbook Pro M1 Chip',
              image: imgP3,
            ),
          ),
        );
  }
}
