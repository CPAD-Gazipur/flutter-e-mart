import '../../../consts/consts.dart';

Widget messageSendBubbleWidget({
  required String message,
  required String messageTime,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Container(
        margin: const EdgeInsets.only(
          left: 40.0,
          top: 8.0,
          bottom: 2.0,
          right: 8.0,
        ),
        decoration: const BoxDecoration(
          color: redColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            message,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(
          right: 10,
        ),
        child: Text(
          messageTime,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.grey.withOpacity(0.8),
          ),
        ),
      )
    ],
  );
}
