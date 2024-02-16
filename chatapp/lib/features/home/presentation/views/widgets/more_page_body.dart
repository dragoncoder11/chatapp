import 'package:chatapp/core/utils/constants.dart';
import 'package:chatapp/core/utils/custom_row.dart';
import 'package:chatapp/core/utils/styles.dart';
import 'package:flutter/material.dart';

class MorePageBody extends StatelessWidget {
  const MorePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:const  EdgeInsets.all(20),
      child:  SafeArea(
        child:  Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         const  Text('More',style: Styles.styles18w600,),
           const SizedBox(height: 32,),
             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                         const Row(
                            children: [
                 Icon(Icons.arrow_forward_ios,color: kgreycolor,),
                            ],
                          ),
               ],
             ),
                 const  SizedBox(height: 40,),
                const CustomRow(icon: Icons.person, text: 'Account'),
                const CustomRow(icon: Icons.quick_contacts_mail, text: 'Chats'),
                const CustomRow(icon: Icons.sunny, text: 'Appereance'),
                const CustomRow(icon: Icons.notifications, text: 'Notification'),
                const CustomRow(icon: Icons.privacy_tip, text: 'Privacy'),
                const CustomRow(icon: Icons.message, text: 'Data Usage'),
                const CustomRow(icon: Icons.help, text: 'Help'),
                const CustomRow(icon: Icons.inventory_outlined, text: 'Invite Your Friends'),
          ],
        ),
      ),
    );
  }
}