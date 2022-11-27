import 'package:flutter_e_mart/consts/consts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: 'Cart is empty'
          .text
          .fontFamily(semibold)
          .color(darkFontGrey)
          .makeCentered(),
    );
  }
}
