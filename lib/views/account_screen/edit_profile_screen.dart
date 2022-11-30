import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/widgets/background_widget.dart';
import 'package:flutter_e_mart/widgets/custom_button_widget.dart';
import 'package:flutter_e_mart/widgets/custom_text_form_field_widget.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return backgroundWidget(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Edit Profile'),
          iconTheme: const IconThemeData(
            color: whiteColor,
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// PROFILE SCREEN

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

            5.heightBox,
            CustomButtonWidget(
              title: 'Upload Image',
              titleColor: whiteColor,
              backgroundColor: redColor,
              onPressed: () {},
            ),
            const Divider(),
            20.heightBox,
            customTextFormFieldWidget(
              label: name,
              hintText: nameHint,
            ),
            customTextFormFieldWidget(
                label: password, hintText: passwordHint, isPassword: true,),
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
    );
  }
}
