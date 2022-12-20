import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/controllers/controllers.dart';
import 'package:flutter_e_mart/services/firestore_services.dart';
import 'package:flutter_e_mart/views/views.dart';
import 'package:flutter_e_mart/widgets/widgets.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var chatController = Get.put(ChatController());

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title:
            'Chat Screen'.text.fontFamily(semibold).color(darkFontGrey).make(),
        backgroundColor: whiteColor,
        centerTitle: false,
        elevation: 2,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: Obx(
                () => chatController.isLoading.value
                    ? loadingIndicator()
                    : StreamBuilder<QuerySnapshot>(
                        stream: FirestoreServices.getAllMessages(
                          chatID: chatController.chatID.toString(),
                        ),
                        builder: (
                          BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot,
                        ) {
                          if (!snapshot.hasData) {
                            return loadingIndicator();
                          } else if (snapshot.data!.docs.isEmpty) {
                            return Center(
                              child: 'Send a message...'.text.make(),
                            );
                          } else {
                            var messageData = snapshot.data!.docs;

                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: messageData.length,
                              itemBuilder: (context, index) {
                                return messageSendBubbleWidget(
                                  message: messageData[index]['message'],
                                  messageTime: messageData[index]
                                          ['sending_time']
                                      .toDate(),
                                );
                              },
                            );
                          }
                        },
                      ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: customTextFormFieldWidget(
                  controller: chatController.messageController,
                  label: '',
                  hintText: 'Type a message...',
                  keyboardType: TextInputType.text,
                  isLabelShow: false,
                ),
              ),
              IconButton(
                onPressed: () {
                  if (chatController.messageController.text.isNotEmpty) {
                    chatController.sendMessage(
                      message: chatController.messageController.text,
                    );
                    chatController.messageController.clear();
                  }
                },
                icon: const Icon(
                  Icons.send,
                  color: redColor,
                ),
              ),
            ],
          )
              .box
              .white
              .shadowSm
              .padding(
                const EdgeInsets.only(
                  top: 8,
                  bottom: 8,
                  left: 12.0,
                  right: 8.0,
                ),
              )
              .make(),
        ],
      ),
    );
  }
}
