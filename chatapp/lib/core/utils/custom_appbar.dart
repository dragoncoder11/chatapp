
import 'package:chatapp/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key, required this.ontap, required this.icon, required this.title,
  });
  final Function()ontap;
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
     Text(title,style: Styles.styles18w600,),
     IconButton(onPressed:ontap, icon: Icon(icon,size: 30,),)
    ],);
  }
}