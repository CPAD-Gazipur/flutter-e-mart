import 'dart:io';

import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/controllers/controllers.dart';
import 'package:flutter_e_mart/widgets/background_widget.dart';
import 'package:flutter_e_mart/widgets/custom_button_widget.dart';
import 'package:flutter_e_mart/widgets/custom_text_form_field_widget.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;

  const EditProfileScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var profileController = Get.find<ProfileController>();

    profileController.nameController.text = data['name'];

    return backgroundWidget(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Edit Profile'),
          iconTheme: const IconThemeData(
            color: whiteColor,
          ),
        ),
        body: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// PROFILE SCREEN
              profileController.profileImageUrl.isEmpty
                  ? Image.network(
                      data['imageUrl'] == ''
                          ? profileImage
                          : '${data['imageUrl']}',
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
                      .make()
                  : Image.file(
                      File(profileController.profileImageUrl.value),
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

              5.heightBox,
              CustomButtonWidget(
                title: 'Upload Image',
                titleColor: whiteColor,
                backgroundColor: redColor,
                onPressed: () {
                  profileController.uploadImage(context: context);
                },
              ),
              const Divider(),
              20.heightBox,
              customTextFormFieldWidget(
                controller: profileController.nameController,
                label: name,
                hintText: nameHint,
              ),
              customTextFormFieldWidget(
                controller: profileController.passwordController,
                label: password,
                hintText: passwordHint,
                isPassword: true,
              ),
              20.heightBox,
              SizedBox(
                width: context.screenWidth - 20,
                child: CustomButtonWidget(
                  title: 'Save',
                  titleColor: whiteColor,
                  backgroundColor: redColor,
                  onPressed: () {},
                ),
              ),
            ],
          )
              .box
              .white
              .roundedSM
              .outerShadow
              .padding(const EdgeInsets.all(16))
              .margin(
                const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 50,
                ),
              )
              .make(),
        ),
      ),
    );
  }
}
