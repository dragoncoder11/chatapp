import 'package:chatapp/core/utils/custom_button.dart';
import 'package:chatapp/core/utils/styles.dart';
import 'package:chatapp/features/auth/presentation/views/otp_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginPageBody extends StatefulWidget {
   LoginPageBody({Key? key,}) : super(key: key);

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  String controller = '';
  static String verificationId = '';
  FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 180, right: 20, left: 20),
      child: Form(
        key: formKey,
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
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                    ),
                    languageCode: "en",
                    onChanged: (phone) {
                      print(phone.completeNumber);
                      controller = phone.completeNumber;
                    },
                  ),
                ],
              ),
            ),
            CustomButton(ontap: () async {
                try {
                  await auth.verifyPhoneNumber(
                    phoneNumber: controller,
                    verificationCompleted: (PhoneAuthCredential credential) async {
                      await auth.signInWithCredential(credential);
                    },
                    verificationFailed: (FirebaseAuthException e) {
                      if (e.code == 'invalid-phone-number') {
                        print('The provided phone number is not valid.');
                      }
                      // Handle other errors
                    },
                    codeSent: (String verificationId, int? resendToken) async {
                      _LoginPageBodyState.verificationId = verificationId;
                      setState(() {});
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );
                } catch (e) {}

                Navigator.of(context).pushNamed(
                  OtpPage.id,
                  arguments: controller,
                );
              },
              title: 'continue',
              color: Colors.blue, ),
            
          ],
        ),
      ),
    );
  }
}