import 'package:chatapp/core/utils/constants.dart';
import 'package:chatapp/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatCardForFriend extends StatelessWidget {
  const ChatCardForFriend({super.key, required this.message, required this.date, });
final String message;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
       var mq=MediaQuery.of(context).size;
    String formattedDate = DateFormat.jm().format(date);

    return Align(
      alignment:Alignment.centerRight,
      child: Container(/* width:mq.width*.5 , */margin:const EdgeInsets.only(top: 15), child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16,vertical: 18),
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(message,style: Styles.styles14w400,),
                Text(
               // DateFormat('MMM dd, yyyy').format(date),
               formattedDate,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
                ],
              ),
            ),
            decoration:const BoxDecoration(color: Colors.blue,
            borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15),topLeft: Radius.circular(15),)),
            ),
    );
  }
}