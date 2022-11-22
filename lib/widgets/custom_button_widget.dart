import 'package:flutter_e_mart/consts/consts.dart';

Widget customButtonWidget({
  required String title,
  required Color titleColor,
  required Color backgroundColor,
  required VoidCallback? onPressed,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      padding: const EdgeInsets.all(12),
    ),
    onPressed: onPressed,
    child: title.text.color(titleColor).fontFamily(bold).make(),
  );
}
