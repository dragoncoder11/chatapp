
import 'package:chatapp/core/utils/constants.dart';
import 'package:chatapp/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({
    super.key,  required this.name, required this.phone,
  });
//final String image;
final String name;
final String phone;
  @override
  Widget build(BuildContext context) {
    return Container(color: kPrimaryColor,
      child: Column(
        children: [
          Row(children: [
           Container(height: 50,width: 50,decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),image: DecorationImage(image: AssetImage('assets/default.jpg'),fit: BoxFit.fill)),),
           const SizedBox(width: 20,),
           Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
             Text(name,style: Styles.styles14w400,),
             const SizedBox(height: 8,),
              Text(phone,style: Styles.styles12w400,),
           ],),
          ],),
          const SizedBox(height: 15,),
            const Divider(thickness: .1,color: kgreycolor,),
            const SizedBox(height: 15,),
        ],
      ),
    );
  }
}
