import 'package:chatapp/core/utils/custom_text_field.dart';
import 'package:chatapp/features/home/presentation/views/widgets/chat_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatViewInsideBody extends StatefulWidget {
  const ChatViewInsideBody({Key? key, required this.uid}) : super(key: key);
  final String uid;

  @override
  State<ChatViewInsideBody> createState() => _ChatViewInsideBodyState();
}
class _ChatViewInsideBodyState extends State<ChatViewInsideBody> {
  TextEditingController messagecontroller = TextEditingController();
  List<dynamic> messageslist = [];

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Future<void> addUser() async {
    CollectionReference message = FirebaseFirestore.instance
        .collection('contacts')
        .doc(widget.uid)
        .collection('message');

    try {
      await message.add({
        'message': messagecontroller.text,
      });
      print("User Added");
    } catch (error) {
      print("Failed to add user: $error");
    }
  }

  Future<void> getData() async {
    var response = await FirebaseFirestore.instance
        .collection('contacts')
        .doc(widget.uid)
        .collection('message')
        .get();
    setState(() {
      messageslist = response.docs.map((doc) => doc['message']).toList();
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount: messageslist.length,
              itemBuilder: (context, index) {
                return ChatCard(message: messageslist[index]);
              },
            ),
          ),
        ),
        CustomTextField(
          controller: messagecontroller,
          hint: 'Send message',
          icon: Icons.send,
          onpressed: () async {
            await addUser();
            messagecontroller.clear();
            await getData();
          },
        ),
      ],
    );
  }
}