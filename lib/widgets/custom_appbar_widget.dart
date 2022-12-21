import 'package:flutter_e_mart/consts/consts.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final bool showBackIcon;
  final Color textColor;
  final String fontFamily;
  final double elevation;
  final Color backgroundColor;

  const CustomAppBarWidget({
    Key? key,
    required this.title,
    this.fontFamily = bold,
    this.textColor = whiteColor,
    this.showBackIcon = true,
    this.elevation = 0,
    this.backgroundColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: showBackIcon,
      title: title.text.fontFamily(fontFamily).color(textColor).make(),
      elevation: elevation,
      centerTitle: false,
      backgroundColor: backgroundColor,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
