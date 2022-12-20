import '../consts/consts.dart';

Widget customTextFormFieldWidget({
  required String label,
  required String hintText,
  TextInputType keyboardType = TextInputType.text,
  bool isPassword = false,
  TextEditingController? controller,
  bool isLabelShow = true,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      isLabelShow
          ? label.text.color(redColor).fontFamily(semibold).size(14).make()
          : const SizedBox(),
      isLabelShow ? 5.heightBox : const SizedBox(),
      TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: semibold,
            color: textFieldGrey,
          ),
          isDense: true,
          filled: true,
          fillColor: lightGrey,
          border: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: redColor,
            ),
          ),
        ),
      ).box.rounded.make(),
      isLabelShow ? 10.heightBox : const SizedBox(),
    ],
  );
}
