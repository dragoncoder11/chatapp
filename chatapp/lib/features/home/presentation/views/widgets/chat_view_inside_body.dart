import 'package:chatapp/core/utils/custom_text_field.dart';
import 'package:chatapp/features/home/presentation/views/widgets/chat_card.dart';
import 'package:chatapp/features/home/presentation/views/widgets/chat_card_for_friend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatViewInsideBody extends StatelessWidget {
  ChatViewInsideBody({Key? key, required this.uid}) : super(key: key);
  final String uid;

  TextEditingController messagecontroller = TextEditingController();

  final controller = ScrollController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

 Future<void> addUser() async {
  CollectionReference message = FirebaseFirestore.instance
      .collection('contacts')
      .doc(uid)
      .collection('message');

  try {
    await message.add({
      'message': messagecontroller.text,
      'created at': DateTime.now(),
      'created by': FirebaseAuth.instance.currentUser!.uid,
    });
    print("User Added");
  } catch (error) {
    print("Failed to add user: $error");
  }
}

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;

    final Stream<QuerySnapshot> chatstream = FirebaseFirestore.instance
        .collection('contacts')
        .doc(uid)
        .collection('message')
        .orderBy('created at', descending: true)
        .snapshots();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StreamBuilder<QuerySnapshot>(
            stream: chatstream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('error');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(children: [
                  Expanded(
                    child: Column(children: [
                      
                    ],),
                  ),
                CustomTextField(controller: messagecontroller, hint: 'send message')
                ],);
              }
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.builder(
                    
                    reverse: true,
                    controller: controller,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final createdat=snapshot.data!.docs[index]['created at'] as Timestamp;
                      final date=createdat.toDate();
                      return snapshot.data!.docs[index]['created by'] !=
                              FirebaseAuth.instance.currentUser!.uid
                          ? ChatCardForFriend(
                              message: snapshot.data!.docs[index]['message'], date: date,)
                          : ChatCard(
                              message: snapshot.data!.docs[index]['message'], date: date,
                              );
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