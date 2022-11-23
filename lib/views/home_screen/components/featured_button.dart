import 'package:flutter_e_mart/consts/consts.dart';

Widget featuredButton({
  required String featureTitle,
  required String featureImage,
  required VoidCallback? onPressed,
}) {
  return Row(
    children: [
      Image.asset(
        featureImage,
        width: 60,
        fit: BoxFit.fill,
      ),
      10.widthBox,
      featureTitle.text.color(darkFontGrey).fontFamily(semibold).make(),
    ],
  )
      .box
      .white
      .width(200)
      .margin(const EdgeInsets.symmetric(horizontal: 6))
      .roundedSM
      .outerShadowSm
      .padding(const EdgeInsets.all(4.0))
      .make()
      .onTap(onPressed);
}
