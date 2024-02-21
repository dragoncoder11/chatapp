import 'package:chatapp/core/utils/constants.dart';
import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  CustomTextField({required this.controller, required this.hint, this.icon,  this.onpressed, });

  final TextEditingController controller;
  final String hint;
  final IconData? icon;
  final Function()?onpressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: TextFormField(
        cursorColor: kPrimaryColor,
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.white),
          ),
          suffixIcon: IconButton(onPressed:onpressed , icon: Icon(icon,color: kPrimaryColor,size: 30,))
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$hint is required';
          }
          return null;
        },
      ),
    );
  }
}