import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/widgets/widgets.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(
        title: 'Choose Payment Method',
        textColor: darkFontGrey,
        fontFamily: semibold,
        elevation: 2,
        backgroundColor: whiteColor,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 10,
        ),
        child: Hero(
          tag: 'custom_button',
          child: CustomButtonWidget(
            title: 'Place Order',
            titleColor: whiteColor,
            backgroundColor: redColor,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
