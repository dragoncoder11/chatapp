import 'package:chatapp/core/utils/custom_button.dart';
import 'package:chatapp/core/utils/styles.dart';
import 'package:flutter/material.dart';
class OtpPageBody extends StatelessWidget {
  const OtpPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = ModalRoute.of(context)?.settings.arguments.toString();

    return Padding(
      padding: const EdgeInsets.only(top: 180, right: 20, left: 20),
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              const  Text(
                  'Enter Code',
                  style: Styles.styles24bold,
                ),
               const SizedBox(height: 10),
                Text(
                  'We have sent you an SMS with the code to $c',
                  style: Styles.styles14w400,
                  textAlign: TextAlign.center,
                ),
               const SizedBox(height: 60),
              ],
            ),
          ),
          CustomButton(
           
            title: 'Resend Code', ontap: () {  },
          ),
        ],
      ),
    );
  }
}