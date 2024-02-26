import 'package:chatapp/core/utils/custom_text_field.dart';
import 'package:chatapp/features/home/presentation/views/widgets/chat_card.dart';
import 'package:chatapp/features/home/presentation/views/widgets/chat_card_for_friend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatViewInsideBody extends StatefulWidget {
  const ChatViewInsideBody({Key? key, required this.uid}) : super(key: key);
  final String uid;

  @override
  State<ChatViewInsideBody> createState() => _ChatViewInsideBodyState();
}
class _ChatViewInsideBodyState extends State<ChatViewInsideBody> {
  TextEditingController messagecontroller = TextEditingController();
  final controller=ScrollController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Future<void> addUser() async {
    CollectionReference message = FirebaseFirestore.instance
        .collection('contacts')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('message');

    try {
      await message.add({
        'message': messagecontroller.text,
        'created at':DateTime.now(),
      });
      print("User Added");
    } catch (error) {
      print("Failed to add user: $error");
    }
  }
final Stream<QuerySnapshot> chatstream=FirebaseFirestore.instance
        .collection('contacts')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('message').orderBy('created at',descending: true).snapshots();

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      StreamBuilder<QuerySnapshot>(stream: chatstream, builder: (context,snapshot){
      if(snapshot.hasError){
        return Text('error');
      }
         if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
      return   Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              reverse: true,
              controller: controller,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return widget.uid==FirebaseAuth.instance.currentUser!.uid? ChatCardForFriend(message: snapshot.data!.docs[index]['message']):ChatCard(message: snapshot.data!.docs[index]['message']);
              },
            ),
          ),
        );
      }),
        CustomTextField(
          controller: messagecontroller,
          hint: 'Send message',
          icon: Icons.send,
          onpressed: () async {
            await addUser();
            messagecontroller.clear();
            controller.jumpTo(
             0,
            );
          },
        ),
      ],
    );
  }
}