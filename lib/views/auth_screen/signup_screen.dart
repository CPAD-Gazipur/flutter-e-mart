import 'package:flutter/gestures.dart';
import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/widgets/widgets.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isPolicyAndTermsChecked = false;

  @override
  Widget build(BuildContext context) {
    return backgroundWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Center(
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
                    Row(
                      children: [
                        Checkbox(
                          activeColor: redColor,
                          value: isPolicyAndTermsChecked,
                          onChanged: (newValue) {
                            setState(() {
                              isPolicyAndTermsChecked = newValue!;
                            });
                          },
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'I agree to the ',
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: fontGrey,
                                    fontSize: 14,
                                  ),
                                ),
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      debugPrint('Terms & Conditions');
                                    },
                                  text: terms,
                                  style: const TextStyle(
                                    fontFamily: semibold,
                                    color: redColor,
                                    fontSize: 14,
                                  ),
                                ),
                                const TextSpan(
                                  text: ' and ',
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: fontGrey,
                                    fontSize: 14,
                                  ),
                                ),
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      debugPrint('Privacy Policy');
                                    },
                                  text: privacy,
                                  style: const TextStyle(
                                    fontFamily: semibold,
                                    color: redColor,
                                    fontSize: 14,
                                  ),
                                ),
                                const TextSpan(
                                  text: '.',
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: fontGrey,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    5.heightBox,
                    customButtonWidget(
                      title: singUp,
                      titleColor: whiteColor,
                      backgroundColor:
                          isPolicyAndTermsChecked ? redColor : lightGrey,
                      onPressed: isPolicyAndTermsChecked ? () {} : null,
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
      ),
    );
  }
}
