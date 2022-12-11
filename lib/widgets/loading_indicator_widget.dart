import '../consts/consts.dart';

Widget loadingIndicator() {
  return const Center(
    child: CircularProgressIndicator.adaptive(
      valueColor: AlwaysStoppedAnimation(redColor),
    ),
  );
}
