import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return backgroundWidget(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              appLogoWidget(),
              10.heightBox,
              'Log in to $appName'.text.fontFamily(bold).white.make(),
              10.heightBox,
              Column(
                children: [
                  customTextFormFieldWidget(
                    label: email,
                    hintText: emailHint,
                    keyboardType: TextInputType.emailAddress,
                    // controller: controller,
                  ),
                  customTextFormFieldWidget(
                    label: password,
                    hintText: passwordHint,
                    keyboardType: TextInputType.text,
                    isPassword: true,
                    // controller: controller,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: forgetPassword.text.make(),
                    ),
                  ),
                  5.heightBox,
                  customButtonWidget(
                    title: login,
                    titleColor: whiteColor,
                    backgroundColor: redColor,
                    onPressed: () {},
                  ).box.width(context.screenWidth - 60).make(),
                  5.heightBox,
                  createNewAccount.text.color(fontGrey).make(),
                  5.heightBox,
                  customButtonWidget(
                    title: singUp,
                    titleColor: redColor,
                    backgroundColor: lightGolden,
                    onPressed: () {},
                  ).box.width(context.screenWidth - 60).make(),
                  10.heightBox,
                  loginWith.text.color(fontGrey).make(),
                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(const EdgeInsets.all(16.0))
                  .width(context.screenWidth - 40)
                  .make(),
            ],
          ),
        ),
      ),
    );
  }
}
