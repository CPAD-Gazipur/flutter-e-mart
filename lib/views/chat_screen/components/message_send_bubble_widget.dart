import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../consts/consts.dart';

Widget messageSendBubbleWidget({
  required bool isSeller,
  required String message,
  required Timestamp? messageTime,
}) {
  return Column(
    mainAxisAlignment:
        isSeller ? MainAxisAlignment.start : MainAxisAlignment.end,
    crossAxisAlignment:
        isSeller ? CrossAxisAlignment.start : CrossAxisAlignment.end,
    children: [
      Container(
        margin: EdgeInsets.only(
          left: isSeller ? 8.0 : 40.0,
          top: 6.0,
          bottom: 2.0,
          right: isSeller ? 40.0 : 8.0,
        ),
        decoration: BoxDecoration(
          color: isSeller ? whiteColor : redColor.withOpacity(0.8),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft: isSeller ? Radius.zero : const Radius.circular(12),
            bottomRight: isSeller ? const Radius.circular(12) : Radius.zero,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            message,
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: isSeller ? Colors.black87 : Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(
          right: isSeller ? 0 : 10,
          left: isSeller ? 10 : 0,
        ),
        padding: const EdgeInsets.only(
          bottom: 4,
        ),
        child: Text(
          timeago.format(messageTime?.toDate() ?? DateTime.now()),
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
