import 'package:chatapp/core/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({super.key, required this.controller, required this.hint, required this.type});
 final GlobalKey formkey=GlobalKey<FormState>();
 final TextEditingController controller;
 final String hint;
  final TextInputType type;
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: formkey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
        child: TextFormField(
          controller: controller,
        decoration: InputDecoration(
          fillColor: kgreycolor,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:const BorderSide(color: Colors.white ),
          ),
            focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:const BorderSide(color: Colors.white ),
          ),
          
        ),
        keyboardType: type,
        validator: (value) {
          if(value==null|| value.isEmpty){
            return '$hint is required';
          }
        },
        ),
      ),
    );
  }
}