import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/views/views.dart';
import 'package:flutter_e_mart/widgets/widgets.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return backgroundWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              appLogoWidget(),
              10.heightBox,
              'Log in to $appName'.text.fontFamily(bold).white.make(),
              15.heightBox,
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
                  CustomButtonWidget(
                    title: login,
                    titleColor: whiteColor,
                    backgroundColor: redColor,
                    onPressed: () {
                      Get.to(() => const HomeNavBar());
                    },
                  ).box.width(context.screenWidth - 60).make(),
                  5.heightBox,
                  createNewAccount.text.color(fontGrey).make(),
                  5.heightBox,
                  CustomButtonWidget(
                    title: singUp,
                    titleColor: redColor,
                    backgroundColor: lightGolden,
                    onPressed: () {
                      Get.to(() => const SignupScreen());
                    },
                  ).box.width(context.screenWidth - 60).make(),
                  10.heightBox,
                  loginWith.text.color(fontGrey).make(),
                  5.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      socialIconList.length,
                      (index) => InkWell(
                        onTap: () {
                          debugPrint('TAP: ${socialIconList[index]}');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: lightGrey,
                            radius: 20,
                            child: Image.asset(
                              socialIconList[index],
                              width: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(const EdgeInsets.all(16.0))
                  .width(context.screenWidth - 40)
                  .shadowSm
                  .make(),
            ],
          ),
        ),
      ),
    );
  }
}
