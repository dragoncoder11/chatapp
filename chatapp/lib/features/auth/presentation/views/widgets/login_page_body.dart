import 'package:chatapp/core/utils/custom_button.dart';
import 'package:chatapp/core/utils/styles.dart';
import 'package:chatapp/features/auth/presentation/views/otp_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
class LoginPageBody extends StatefulWidget {
  @override
  _LoginPageBodyState createState() =>
      _LoginPageBodyState();
}

class _LoginPageBodyState
    extends State<LoginPageBody> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String _verificationId;
  TextEditingController _phoneController = TextEditingController();
  late String _smsCode;
  

  Future<void> _verifyPhoneNumber() async {
    final String phoneNo = _phoneController.text.trim();
    if (phoneNo.isEmpty) {
      // TODO: Handle empty phone number input
      return;
    }

    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential credential) {
      _auth.signInWithCredential(credential);
      // TODO: Perform any necessary actions after verification is completed
    };

    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      // TODO: Handle verification failure
      print('Verification failed: ${authException.message}');
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int? forceResendingToken]) async {
      _verificationId = verificationId;
      // TODO: Show dialog to take input SMS code from the user
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      _verificationId = verificationId;
    };

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      timeout: Duration(seconds: 60),
    );
  }

  Future<void> _signInWithPhoneNumber() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: _smsCode,
      );
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;
      // TODO: Perform any necessary actions after successful sign-in
    } catch (e) {
      // TODO: Handle sign-in failure
      print('Sign-in failed: $e');
    }
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Number Authentication'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
              ),
              SizedBox(height: 16),
              CustomButton(ontap: _verifyPhoneNumber, title: 'Verify Phone Number', color: Colors.blueAccent),
             
              SizedBox(height: 16),
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
        ),
      ),
    );
  }
}