import 'package:flutter/gestures.dart';
import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/controllers/controllers.dart';
import 'package:flutter_e_mart/views/auth_screen/login_screen.dart';
import 'package:flutter_e_mart/widgets/widgets.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isPolicyAndTermsChecked = false;
  var authController = Get.put(AuthController());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
                Obx(
                  () => Column(
                    children: [
                      customTextFormFieldWidget(
                        label: name,
                        hintText: nameHint,
                        keyboardType: TextInputType.name,
                        controller: nameController,
                      ),
                      customTextFormFieldWidget(
                        label: email,
                        hintText: emailHint,
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                      ),
                      customTextFormFieldWidget(
                        label: password,
                        hintText: passwordHint,
                        keyboardType: TextInputType.text,
                        isPassword: true,
                        controller: passwordController,
                      ),
                      customTextFormFieldWidget(
                        label: confirmPassword,
                        hintText: passwordHint,
                        keyboardType: TextInputType.text,
                        isPassword: true,
                        controller: confirmPasswordController,
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
                      authController.isLoading.value
                          ? const Center(
                              child: CircularProgressIndicator.adaptive(
                                valueColor: AlwaysStoppedAnimation(redColor),
                              ),
                            )
                          : CustomButtonWidget(
                              title: singUp,
                              titleColor: whiteColor,
                              backgroundColor: isPolicyAndTermsChecked
                                  ? redColor
                                  : lightGrey,
                              onPressed: isPolicyAndTermsChecked
                                  ? () async {
                                      if (nameController.text.isEmpty) {
                                        VxToast.show(
                                          context,
                                          msg: 'Name can\'t be empty',
                                          textColor: whiteColor,
                                          bgColor: redColor,
                                        );
                                      } else if (emailController.text.isEmpty) {
                                        VxToast.show(
                                          context,
                                          msg: 'Email can\'t be empty',
                                          textColor: whiteColor,
                                          bgColor: redColor,
                                        );
                                      } else if (!emailController
                                          .text.isEmail) {
                                        VxToast.show(
                                          context,
                                          msg: 'Enter an valid Email address',
                                          textColor: whiteColor,
                                          bgColor: redColor,
                                        );
                                      } else if (passwordController
                                          .text.isEmpty) {
                                        VxToast.show(
                                          context,
                                          msg: 'Password can\'t be empty',
                                          textColor: whiteColor,
                                          bgColor: redColor,
                                        );
                                      } else if (passwordController
                                              .text.length <
                                          6) {
                                        VxToast.show(
                                          context,
                                          msg: 'Password must at least 6 digit',
                                          textColor: whiteColor,
                                          bgColor: redColor,
                                        );
                                      } else if (confirmPasswordController
                                          .text.isEmpty) {
                                        VxToast.show(
                                          context,
                                          msg:
                                              'Confirm password can\'t be empty',
                                          textColor: whiteColor,
                                          bgColor: redColor,
                                        );
                                      } else if (passwordController.text !=
                                          confirmPasswordController.text) {
                                        VxToast.show(
                                          context,
                                          msg:
                                              'Confirm password is not matched',
                                          textColor: whiteColor,
                                          bgColor: redColor,
                                        );
                                      } else if (nameController
                                              .text.isNotEmpty &&
                                          emailController.text.isEmail &&
                                          passwordController.text.length >= 6) {
                                        try {
                                          authController.isLoading(true);

                                          await authController
                                              .signUpWithEmailAndPassword(
                                            context: context,
                                            email: emailController.text,
                                            password: passwordController.text,
                                          )
                                              .then((userCredentials) {
                                            if (userCredentials != null) {
                                              if (userCredentials
                                                  .additionalUserInfo!
                                                  .isNewUser) {
                                                return authController
                                                    .storeNewUserDataIntoFireStore(
                                                  uID:
                                                      userCredentials.user!.uid,
                                                  name: nameController.text,
                                                  email: emailController.text,
                                                  imageUrl: userCredentials
                                                          .user?.photoURL ??
                                                      '',
                                                );
                                              }
                                            }
                                            authController.isLoading(false);
                                          }).then((value) {
                                            VxToast.show(context,
                                                msg: loggedIn);
                                            Get.offAll(
                                                () => const LoginScreen());
                                          });
                                        } catch (e) {
                                          authController.isLoading(false);
                                          authController.signOutUser(
                                              context: context);
                                          debugPrint('SIGNUP ERROR: $e');
                                          VxToast.show(context,
                                              msg: e.toString());
                                        }
                                      } else {
                                        VxToast.show(
                                          context,
                                          msg: 'Something went wrong',
                                          textColor: whiteColor,
                                          bgColor: redColor,
                                        );
                                      }
                                    }
                                  : null,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
