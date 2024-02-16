
import 'package:chatapp/core/utils/constants.dart';
import 'package:chatapp/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
         Container(height: 50,width: 50,decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),image:const DecorationImage(image: AssetImage('assets/c.png'),fit: BoxFit.fill)),),
         const SizedBox(width: 20,),
        const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
           Text('Athalia Putri',style: Styles.styles14w400,),
            SizedBox(height: 8,),
            Text('Last seen yesterday',style: Styles.styles12w400,),
         ],),
        ],),
        const SizedBox(height: 15,),
          const Divider(thickness: .1,color: kgreycolor,),
          const SizedBox(height: 15,),
      ],
    );
  }
}
