import 'package:flutter_e_mart/consts/consts.dart';

Widget customHomeButton({
  required double width,
  required double height,
  required String image,
  required String title,
  VoidCallbackAction? onPressed,
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
  ).box.rounded.white.size(width, height).shadowXs.make();
}
