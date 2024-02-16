import 'package:chatapp/core/utils/constants.dart';
import 'package:chatapp/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
        hintText: 'Search',
        hintStyle: Styles.styles14w400,
        prefixIcon:const Icon(Icons.search),
        fillColor: kgreycolor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:const BorderSide(color: Colors.white)
        ),
      ),
      cursorColor: Colors.white,
    );
  }
}