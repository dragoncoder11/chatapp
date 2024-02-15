import 'package:chatapp/core/utils/styles.dart';
import 'package:flutter/material.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.only(top: 80,right: 20,left: 20),
      child:  Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Enter Your Phone Number',style: Styles.styles24bold,),
          Text('Please confirm your country code and enter your phone number',style: Styles.styles14w400,)
        ],
      ),
    );
  }
}