import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/views/views.dart';
import 'package:flutter_e_mart/widgets/background_widget.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return backgroundWidget(
      child: Scaffold(
        body: SafeArea(
          child: Column(
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
                    debugPrint('EDIT PROFILE');
                  })
                  .box
                  .padding(const EdgeInsets.symmetric(horizontal: 16.0))
                  .make(),
              Row(
                children: [
                  Image.asset(
                    imgProfile2,
                    fit: BoxFit.cover,
                    width: 80,
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
                        'Joya Ahasan'
                            .text
                            .fontFamily(semibold)
                            .size(18)
                            .white
                            .make(),
                        2.heightBox,
                        'joya_actor@gmail.com'
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
                    onPressed: () {
                      debugPrint('LOGOUT');
                    },
                    child: logout.text.fontFamily(semibold).white.make(),
                  ),
                ],
              ).box.padding(const EdgeInsets.symmetric(horizontal: 16)).make(),
              10.heightBox,

              /// PROFILE BUTTON SECTION
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  profileCardButtonWidget(
                    context: context,
                    total: '00',
                    title: cart,
                  ),
                  profileCardButtonWidget(
                    context: context,
                    total: '14',
                    title: wishList,
                  ),
                  profileCardButtonWidget(
                    context: context,
                    total: '46',
                    title: orders,
                  ),
                ],
              ),

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
                  .margin(const EdgeInsets.all(12.0))
                  .padding(const EdgeInsets.symmetric(horizontal: 16))
                  .outerShadowSm
                  .make()
                  .box
                  .color(redColor)
                  .make(),
            ],
          ),
        ),
      ),
    );
  }
}
