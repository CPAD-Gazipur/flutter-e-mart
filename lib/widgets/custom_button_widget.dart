import 'package:flutter_e_mart/consts/consts.dart';

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color titleColor;
  final VoidCallback? onPressed;

  const CustomButtonWidget({
    Key? key,
    required this.title,
    required this.titleColor,
    required this.backgroundColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.all(12),
      ),
      onPressed: onPressed,
      child: title.text.color(titleColor).fontFamily(bold).make(),
    );
  }
}
