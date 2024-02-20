import 'package:chatapp/core/utils/custom_text_field.dart';
import 'package:chatapp/features/home/presentation/views/widgets/chat_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatViewInsideBody extends StatefulWidget {
  const ChatViewInsideBody({super.key, required this.uid});
 final String uid;

  @override
  State<ChatViewInsideBody> createState() => _ChatViewInsideBodyState();
}

class _ChatViewInsideBodyState extends State<ChatViewInsideBody> {
 TextEditingController messagecontroller=TextEditingController();
    var messageslist=[];
            GlobalKey formkey=GlobalKey<FormState>();
    addUser() async {
        CollectionReference messages = FirebaseFirestore.instance.collection('contacts').doc(widget.uid).collection('messages');

      try {
       var response=await messages.add({
          'message': messagecontroller.text,
        });
        print("User Added");
      } catch (error) {
        print("Failed to add user: $error");
      }
    
    }
    getData()async{
    var response =await FirebaseFirestore.instance.collection('contacts').doc(widget.uid).collection('messages').get();
      messageslist.addAll(response.docs);
      setState(() {
        
      });
    }

  
  @override
  void initState() {
    getData();
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
   var mq=MediaQuery.of(context).size;
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding:const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(itemCount: messageslist.length,itemBuilder: (context,index){
              return ChatCard(message:messageslist[index]['message'],);

            })
          ),
        ),
        CustomTextField(controller: messagecontroller, hint: 'send message',icon: Icons.send,onpressed: ()async {
          await addUser();
          messagecontroller.clear();
          messageslist=[];
          await getData();
        },),
      ],
    );
  }
}