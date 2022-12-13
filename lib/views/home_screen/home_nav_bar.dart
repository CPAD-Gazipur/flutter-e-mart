import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/controllers/controllers.dart';
import 'package:flutter_e_mart/views/account_screen/account_screen.dart';
import 'package:flutter_e_mart/views/cart_screen/cart_screen.dart';
import 'package:flutter_e_mart/views/category_screen/category_screen.dart';
import 'package:flutter_e_mart/views/home_screen/home_screen.dart';
import 'package:get/get.dart';

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    var navItem = [
      BottomNavigationBarItem(
        icon: Image.asset(
          icHome,
          width: 18,
        ),
        activeIcon: Image.asset(
          icHome,
          width: 18,
          color: redColor,
        ),
        label: home,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          icCategories,
          width: 18,
        ),
        activeIcon: Image.asset(
          icCategories,
          width: 18,
          color: redColor,
        ),
        label: categories,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          icCart,
          width: 18,
        ),
        activeIcon: Image.asset(
          icCart,
          width: 18,
          color: redColor,
        ),
        label: cart,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          icProfile,
          width: 18,
        ),
        activeIcon: Image.asset(
          icProfile,
          width: 18,
          color: redColor,
        ),
        label: account,
      ),
    ];

    var navBody = [
      const HomeScreen(),
      const CategoryScreen(),
      const CartScreen(),
      const AccountScreen(),
    ];

    return WillPopScope(
      onWillPop: () async {
        if (controller.currentNaIndex.value != 0) {
          controller.currentNaIndex.value = 0;
          return Future(() => false);
        } else {
          return (await showDialog(
                context: context,
                builder: (context) => Platform.isIOS
                    ? AlertDialog(
                        title: const Text('Warning!'),
                        content: const Text('Want to exit from E-Mart?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text('No'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text('Yes'),
                          ),
                        ],
                      )
                    : CupertinoAlertDialog(
                        title: const Text('Warning!'),
                        content: const Text('Want to exit from E-Mart?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text('No'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text('Yes'),
                          ),
                        ],
                      ),
              )) ??
              false;
        }
      },
      child: Scaffold(
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
      ),
    );
  }
}
