import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/views/chat_screen/components/message_send_bubble_widget.dart';
import 'package:flutter_e_mart/widgets/widgets.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              child: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  messageSendBubbleWidget(
                    message: 'Sample Messages that has been created.',
                    messageTime: '09:00 AM',
                  ),
                  messageSendBubbleWidget(
                    message: 'Hello',
                    messageTime: '09:00 AM',
                  ),
                  messageSendBubbleWidget(
                    message: 'Hello',
                    messageTime: '09:00 AM',
                  ),
                  messageSendBubbleWidget(
                    message: 'Hello',
                    messageTime: '09:00 AM',
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: customTextFormFieldWidget(
                  controller: TextEditingController(),
                  label: '',
                  hintText: 'Type a message...',
                  keyboardType: TextInputType.text,
                  isLabelShow: false,
                ),
              ),
              IconButton(
                onPressed: () {},
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
