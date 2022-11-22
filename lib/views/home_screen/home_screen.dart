import 'package:flutter/material.dart';
import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/controllers/contollers.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    var navItem = [
      BottomNavigationBarItem(
        icon: Image.asset(
          icHome,
          width: 18,
        ),
        label: home,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          icCategories,
          width: 18,
        ),
        label: categories,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          icCart,
          width: 18,
        ),
        label: cart,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          icProfile,
          width: 18,
        ),
        label: account,
      ),
    ];

    var navBody = [
      Container(color: Colors.red),
      Container(color: Colors.amber),
      Container(color: Colors.grey),
      Container(color: Colors.blue),
    ];

    return Scaffold(
      body: Obx(
        () => navBody[controller.currentNaIndex.value],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentNaIndex.value,
          selectedItemColor: redColor,
          selectedLabelStyle: const TextStyle(
            fontFamily: regular,
            fontSize: 12,
          ),
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          items: navItem,
          onTap: (newValue) {
            controller.currentNaIndex.value = newValue;
          },
        ),
      ),
    );
  }
}
