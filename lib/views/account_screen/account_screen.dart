import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/controllers/controllers.dart';
import 'package:flutter_e_mart/services/firestore_services.dart';
import 'package:flutter_e_mart/views/views.dart';
import 'package:flutter_e_mart/widgets/background_widget.dart';
import 'package:get/get.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var profileController = Get.put(ProfileController());

    return backgroundWidget(
      child: Scaffold(
        body: SafeArea(
          child: StreamBuilder(
            stream: FirestoreServices.getUserInfo(uID: auth.currentUser!.uid),
            builder: (
              BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot,
            ) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation(redColor),
                  ),
                );
              } else {
                var data = snapshot.data!.docs[0];

                return Column(
                  children: [
                    /// PROFILE INFO SECTION
                    10.heightBox,
                    const Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.edit,
                        color: whiteColor,
                      ),
                    )
                        .onTap(() {
                          Get.to(() => const EditProfileScreen());
                        })
                        .box
                        .padding(const EdgeInsets.symmetric(horizontal: 16.0))
                        .make(),

                    5.heightBox,

                    Row(
                      children: [
                        Image.network(
                          data['imageUrl'] == ''
                              ? profileImage
                              : '${data['imageUrl']}',
                          fit: BoxFit.cover,
                          width: 70,
                        )
                            .box
                            .white
                            .roundedFull
                            .clip(Clip.antiAlias)
                            .make()
                            .box
                            .white
                            .roundedFull
                            .clip(Clip.antiAlias)
                            .padding(const EdgeInsets.all(2))
                            .outerShadow
                            .make(),
                        10.widthBox,
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              '${data['name']}'
                                  .text
                                  .fontFamily(semibold)
                                  .size(18)
                                  .white
                                  .make(),
                              2.heightBox,
                              '${data['email']}'
                                  .text
                                  .white
                                  .maxLines(1)
                                  .ellipsis
                                  .make(),
                            ],
                          ),
                        ),
                        10.widthBox,
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: whiteColor,
                            ),
                          ),
                          onPressed: () async {
                            await Get.put(AuthController())
                                .signOutUser(context: context);
                            Get.offAll(() => const LoginScreen());
                          },
                          child: logout.text.fontFamily(semibold).white.make(),
                        ),
                      ],
                    )
                        .box
                        .padding(const EdgeInsets.symmetric(horizontal: 16))
                        .make(),

                    20.heightBox,

                    Column(
                      children: [
                        /// PROFILE BUTTON SECTION
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            profileCardButtonWidget(
                                context: context,
                                total: data['cart'] != null
                                    ? '${data['cart'].length}'
                                    : '00',
                                title: cart,
                                onPressed: () {
                                  Get.find<HomeController>()
                                      .currentNaIndex
                                      .value = 2;
                                }),
                            profileCardButtonWidget(
                              context: context,
                              total: data['wishlist'] != null
                                  ? '${data['wishlist'].length}'
                                  : '00',
                              title: wishList,
                            ),
                            profileCardButtonWidget(
                              context: context,
                              total: data['orders'] != null
                                  ? '${data['orders'].length}'
                                  : '00',
                              title: orders,
                            ),
                          ],
                        )
                            .box
                            .padding(const EdgeInsets.symmetric(vertical: 4.0))
                            .make(),

                        /// PROFILE OPTION SECTION
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: profileSectionList[index]
                                  .text
                                  .fontFamily(semibold)
                                  .color(darkFontGrey)
                                  .make(),
                              leading: Image.asset(
                                profileSectionListIcon[index],
                                width: 18,
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 16,
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider(color: lightGrey);
                          },
                          itemCount: profileSectionList.length,
                        )
                            .box
                            .white
                            .roundedSM
                            .margin(const EdgeInsets.only(
                              left: 12.0,
                              right: 12.0,
                              bottom: 16.0,
                              top: 30.0,
                            ))
                            .padding(const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8.0,
                            ))
                            .outerShadow
                            .make(),
                      ],
                    ).box.color(redColor).make(),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
