import 'package:chatapp/core/utils/constants.dart';
import 'package:chatapp/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({super.key, required this.message});
final String message;
  @override
  Widget build(BuildContext context) {
       var mq=MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(width:mq.width*.5 ,margin:const EdgeInsets.only(top: 15), child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16,vertical: 18),
              child: Text(message,style: Styles.styles14w400,),
            ),
            decoration:const BoxDecoration(color: kPrimaryColor,
            borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15),topLeft: Radius.circular(15),)),
            ),
    );
  }
}