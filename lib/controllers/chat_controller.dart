import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/controllers/controllers.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  var chats = firebaseFirestore.collection(chatCollection);

  var sellerName = Get.arguments[0].toString();
  var sellerID = Get.arguments[1].toString();

  var senderName = Get.find<HomeController>().userName.toString();
  var senderID = auth.currentUser!.uid;

  var messageController = TextEditingController();

  dynamic chatID;

  @override
  void onInit() {
    getChatID();
    super.onInit();
  }

  getChatID() async {
    await chats
        .where('users', isEqualTo: {
          sellerID: null,
          senderID: null,
        })
        .limit(1)
        .get()
        .then(
          (QuerySnapshot querySnapshot) {
            if (querySnapshot.docs.isNotEmpty) {
              chatID = querySnapshot.docs.single.id;
            } else {
              chats.add(
                {
                  'sending_time': null,
                  'last_message': '',
                  'senderID': '',
                  'sender_name': senderName,
                  'sellerID': '',
                  'seller_name': sellerName,
                  'users': {
                    sellerID: null,
                    senderID: null,
                  },
                },
              ).then((snapshot) {
                chatID = snapshot.id;
              });
            }
          },
        );
  }

  sendMessage({required String message}) {
    if (message.trim().isNotEmpty) {
      var time = FieldValue.serverTimestamp();

      chats.doc(chatID).update({
        'sending_time': time,
        'last_message': message,
        'senderID': senderID,
        'sellerID': sellerID,
      });

      chats.doc(chatID).collection(messageCollection).doc().set({
        'sending_time': time,
        'message': message,
        'uID': senderID,
      });
    }
  }
}
