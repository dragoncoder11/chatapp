import 'package:chatapp/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({super.key, required this.icon, required this.text});
 final IconData icon;
 final String text;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Icon(icon),
           const SizedBox(width: 7,),
            Text(text,style: Styles.styles14w400,),
          ],),
         const Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}