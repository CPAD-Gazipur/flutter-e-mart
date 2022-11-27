import 'package:flutter_e_mart/consts/consts.dart';

Widget profileCardButtonWidget({
  required BuildContext context,
  required String total,
  required String title,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      total.text.fontFamily(bold).color(darkFontGrey).size(16).make(),
      5.heightBox,
      title.text.color(darkFontGrey).make(),
    ],
  )
      .box
      .white
      .roundedSM
      .width(context.screenWidth / 3.5)
      .height(70)
      .padding(const EdgeInsets.all(4))
      .outerShadow
      .make();
}
