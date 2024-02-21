
import 'package:chatapp/core/utils/constants.dart';
import 'package:chatapp/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key, required this.name,
  });
final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
         Container(height: 50,width: 50,decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),image:const DecorationImage(image: AssetImage('assets/c.png'),fit: BoxFit.fill)),),
         const SizedBox(width: 20,),
         Expanded(
          child:  Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(name,style: Styles.styles14w400,),
                 Text('17/6',style: Styles.styles10w400,),
               ],
             ),
              SizedBox(height: 8,),
              Text('Last seen yesterday',style: Styles.styles12w400,),
           ],),
        ),
        ],),
        const SizedBox(height: 15,),
          const Divider(thickness: .1,color: kgreycolor,),
          const SizedBox(height: 15,),
      ],
    );
  }
}
