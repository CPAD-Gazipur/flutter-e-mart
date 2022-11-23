import 'package:flutter_e_mart/consts/consts.dart';

Widget customHomeButton({
  required double width,
  required double height,
  required String image,
  required String title,
  required VoidCallback? onPressed,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        image,
        width: 26,
      ),
      10.heightBox,
      title.text.fontFamily(semibold).color(darkFontGrey).make(),
    ],
  )
      .box
      .roundedSM
      .white
      .size(width, height)
      .outerShadowSm
      .make()
      .onTap(onPressed);
}
