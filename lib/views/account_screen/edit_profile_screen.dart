import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
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
          () => SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// PROFILE SCREEN
                profileController.profileImageUrl.isEmpty
                    ? CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.transparent,
                        child: CachedNetworkImage(
                          imageUrl: '${data['imageUrl']}',
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ).box.roundedFull.clip(Clip.antiAlias).make(),
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator.adaptive(
                              valueColor: AlwaysStoppedAnimation(redColor),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              Image.network(profileImage)
                                  .box
                                  .roundedFull
                                  .clip(Clip.antiAlias)
                                  .make(),
                        ),
                      )
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
                    profileController.getImageFromGallery(context: context);
                  },
                ),
                const Divider(),
                20.heightBox,
                customTextFormFieldWidget(
                  controller: profileController.nameController,
                  label: name,
                  hintText: nameHint,
                ),
                20.heightBox,
                SizedBox(
                  width: context.screenWidth - 20,
                  child: profileController.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator.adaptive(
                            valueColor: AlwaysStoppedAnimation(redColor),
                          ),
                        )
                      : CustomButtonWidget(
                          title: 'Save',
                          titleColor: whiteColor,
                          backgroundColor: redColor,
                          onPressed: () async {
                            if (profileController
                                .nameController.text.isNotEmpty) {
                              profileController.isLoading(true);

                              if (profileController
                                  .profileImageUrl.value.isNotEmpty) {
                                await profileController
                                    .uploadProfileImageToFireStore();
                              } else {
                                profileController.profileImageDownloadedUrl
                                    .value = data['imageUrl'];
                              }

                              await profileController.updateProfileInfo(
                                name: profileController.nameController.text,
                                imageUrl: profileController
                                    .profileImageDownloadedUrl.value,
                              );

                              // ignore: use_build_context_synchronously
                              VxToast.show(
                                context,
                                msg: 'Updated',
                                bgColor: redColor,
                                textColor: whiteColor,
                              );
                            } else {
                              VxToast.show(
                                context,
                                msg: 'Name can\'t be empty!',
                                bgColor: redColor,
                                textColor: whiteColor,
                              );
                            }
                          },
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
      ),
    );
  }
}
