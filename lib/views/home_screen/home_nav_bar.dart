import 'package:badges/badges.dart' as badge;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/controllers/controllers.dart';
import 'package:flutter_e_mart/services/services.dart';
import 'package:flutter_e_mart/views/views.dart';
import 'package:get/get.dart';

class HomeNavBar extends StatefulWidget {
  const HomeNavBar({super.key});

  @override
  State<HomeNavBar> createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<HomeNavBar> {
  late final NotificationService notificationService;

  void listenToNotificationStream() =>
      notificationService.behaviorSubject.listen(
        (payload) {
          debugPrint(payload);
          if (payload == '/cart') {
            Get.to(() => const HomeNavBar());
            Get.find<HomeController>().currentNaIndex.value = 2;
          } else {
            Get.put(CartController());
            Get.to(() => const ShippingDetailsScreen());
          }
        },
      );

  @override
  void initState() {
    notificationService = NotificationService();
    listenToNotificationStream();
    notificationService.initializePlatformNotifications();
    super.initState();
  }

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
        icon: StreamBuilder<QuerySnapshot>(
          stream: FirestoreServices.getCartedProducts(
            uID: auth.currentUser!.uid,
          ),
          builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot,
          ) {
            if (!snapshot.hasData) {
              return Image.asset(
                icCart,
                width: 18,
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return Image.asset(
                icCart,
                width: 18,
              );
            } else {
              var data = snapshot.data!.docs;

              if (data.isNotEmpty) {
                return badge.Badge(
                  badgeContent: Text(
                    '${data.length}',
                    style: const TextStyle(
                      color: whiteColor,
                      fontSize: 10,
                    ),
                  ),
                  badgeStyle: badge.BadgeStyle(
                    badgeColor: redColor,
                    shape: badge.BadgeShape.circle,
                    padding: const EdgeInsets.all(5),
                  ),
                  badgeAnimation: badge.BadgeAnimation.scale(),
                  child: Image.asset(
                    icCart,
                    width: 18,
                  ),
                );
              } else {
                return Image.asset(
                  icCart,
                  width: 18,
                );
              }
            }
          },
        ),
        activeIcon: StreamBuilder<QuerySnapshot>(
          stream: FirestoreServices.getCartedProducts(
            uID: auth.currentUser!.uid,
          ),
          builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot,
          ) {
            if (!snapshot.hasData) {
              return Image.asset(
                icCart,
                width: 18,
                color: redColor,
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return Image.asset(
                icCart,
                width: 18,
                color: redColor,
              );
            } else {
              var data = snapshot.data!.docs;

              if (data.isNotEmpty) {
                return badge.Badge(
                  badgeContent: Text(
                    '${data.length}',
                    style: const TextStyle(
                      color: whiteColor,
                      fontSize: 10,
                    ),
                  ),
                  badgeStyle: badge.BadgeStyle(
                    badgeColor: redColor,
                    shape: badge.BadgeShape.circle,
                    padding: const EdgeInsets.all(5),
                  ),
                  badgeAnimation: badge.BadgeAnimation.scale(),
                  child: Image.asset(
                    icCart,
                    width: 18,
                    color: redColor,
                  ),
                );
              } else {
                return Image.asset(
                  icCart,
                  width: 18,
                  color: redColor,
                );
              }
            }
          },
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
