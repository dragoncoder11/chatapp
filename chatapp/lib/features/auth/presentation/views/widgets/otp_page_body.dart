import 'package:chatapp/core/utils/custom_button.dart';
import 'package:chatapp/core/utils/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class OtpPageBody extends StatefulWidget {
  const OtpPageBody({Key? key, required this.verificationId}) : super(key: key);
final String verificationId;

  @override
  State<OtpPageBody> createState() => _OtpPageBodyState();
}

class _OtpPageBodyState extends State<OtpPageBody> {
   late String _smsCode;

   Future<void> _signInWithPhoneNumber() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId.toString(),
        smsCode: _smsCode,
      );
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = userCredential.user;
      // TODO: Perform any necessary actions after successful sign-in
    } catch (e) {
      // TODO: Handle sign-in failure
      print('Sign-in failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = ModalRoute.of(context)?.settings.arguments.toString();
   
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
                  'We have sent you an SMS with the code to $controller',
                  style: Styles.styles14w400,
                  textAlign: TextAlign.center,
                ),
               const SizedBox(height: 60),
              ],
            ),
          ),
        TextField(
                onChanged: (value) {
                  setState(() {
                    _smsCode = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'SMS Code',
                ),
              ),
              SizedBox(height: 16),
              CustomButton(ontap: _signInWithPhoneNumber, title: 'Sign In', color: Colors.amber)
        ],
      ),
    );
  }
}