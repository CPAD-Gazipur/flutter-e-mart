import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/views/views.dart';
import 'package:flutter_e_mart/widgets/widgets.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeSplashUI() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        auth.authStateChanges().listen((User? user) {
          if (user == null && mounted) {
            Get.offAll(() => const LoginScreen());
          } else if (user != null) {
            Get.offAll(() => const HomeNavBar());
          } else {
            Get.offAll(() => const LoginScreen());
          }
        });
      },
    );
  }

  @override
  void initState() {
    changeSplashUI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                icSplashBg,
                width: 300,
              ),
            ),
            20.heightBox,
            appLogoWidget(),
            10.heightBox,
            appName.text.fontFamily(bold).size(22).white.make(),
            5.heightBox,
            appVersion.text.white.make(),
            const Spacer(),
            credits.text.white.fontFamily(semibold).make(),
            30.heightBox,
          ],
        ),
      ),
    );
  }
}
