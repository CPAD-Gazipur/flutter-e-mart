import 'package:flutter/gestures.dart';
import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/widgets/widgets.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

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
              'Join to $appName'.text.fontFamily(bold).white.make(),
              15.heightBox,
              Column(
                children: [
                  customTextFormFieldWidget(
                    label: name,
                    hintText: nameHint,
                    keyboardType: TextInputType.name,
                    // controller: controller,
                  ),
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
                  customTextFormFieldWidget(
                    label: confirmPassword,
                    hintText: passwordHint,
                    keyboardType: TextInputType.text,
                    isPassword: true,
                    // controller: controller,
                  ),
                  5.heightBox,
                  Row(
                    children: [
                      Checkbox(
                        checkColor: redColor,
                        value: false,
                        onChanged: (newValue) {},
                      ),
                      Expanded(
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'I agree to the ',
                                style: TextStyle(
                                  fontFamily: bold,
                                  color: fontGrey,
                                  fontSize: 14,
                                ),
                              ),
                              TextSpan(
                                text: terms,
                                style: TextStyle(
                                  fontFamily: bold,
                                  color: redColor,
                                  fontSize: 14,
                                ),
                              ),
                              TextSpan(
                                text: ' and ',
                                style: TextStyle(
                                  fontFamily: bold,
                                  color: fontGrey,
                                  fontSize: 14,
                                ),
                              ),
                              TextSpan(
                                text: privacy,
                                style: TextStyle(
                                  fontFamily: bold,
                                  color: redColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  customButtonWidget(
                    title: singUp,
                    titleColor: whiteColor,
                    backgroundColor: redColor,
                    onPressed: () {},
                  ).box.width(context.screenWidth - 60).make(),
                  10.heightBox,
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: alreadyHaveAccount,
                          style: TextStyle(
                            fontFamily: regular,
                            color: fontGrey,
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.back();
                            },
                          text: login,
                          style: const TextStyle(
                            fontFamily: bold,
                            color: redColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
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
