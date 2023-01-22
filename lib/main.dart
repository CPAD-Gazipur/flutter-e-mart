import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/views/views.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('${const Color(0xFF234766).value}');

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: darkFontGrey,
          ),
        ),
        fontFamily: regular,
      ),
      home: const SplashScreen(), //const SliverAppBarScreen(),
    );
  }
}
