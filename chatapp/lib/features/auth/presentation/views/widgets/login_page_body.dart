import 'package:chatapp/core/utils/custom_button.dart';
import 'package:chatapp/core/utils/styles.dart';
import 'package:chatapp/features/auth/presentation/views/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginPageBody extends StatelessWidget {
   LoginPageBody({Key? key,}) : super(key: key);

   TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.only(top: 180, right: 20, left: 20),
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               const Text(
                  'Enter Your Phone Number',
                  style: Styles.styles24bold,
                ),
               const SizedBox(height: 10),
               const Text(
                  'Please confirm your country code and enter your phone number',
                  style: Styles.styles14w400,
                  textAlign: TextAlign.center,
                ),
               const SizedBox(height: 60),
                IntlPhoneField(
                  cursorColor: Colors.white,
                  controller: controller,
                 decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border:const OutlineInputBorder(
                      borderSide: BorderSide(),
                      
                    ),
           focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide:const BorderSide(color: Colors.white)),
                  ),
                  languageCode: "en",
                    
                    
                  ),
                
              ],
            ),
          ),
          CustomButton(ontap: (){
           Navigator.of(context).pushNamed(OtpPage.id,arguments: 
              controller.text
            );
          }, title: 'continue')
        ],
      ),
    );
  }
}