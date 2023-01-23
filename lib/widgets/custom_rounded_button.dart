import '../consts/consts.dart';

class CustomRoundedButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color titleColor;
  final VoidCallback? onPressed;

  const CustomRoundedButton({
    Key? key,
    required this.title,
    required this.titleColor,
    required this.backgroundColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: InkWell(
        onTap: onPressed,
        child:
            title.text.color(titleColor).size(16).fontFamily(semibold).make(),
      ),
    );
  }
}
