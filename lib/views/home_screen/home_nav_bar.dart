import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/controllers/controllers.dart';
import 'package:flutter_e_mart/views/views.dart';
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
          return exitButtonWidget(context: context);
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
