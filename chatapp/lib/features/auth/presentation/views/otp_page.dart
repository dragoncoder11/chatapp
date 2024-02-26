import 'package:chatapp/features/auth/presentation/views/widgets/otp_page_body.dart';
import 'package:flutter/material.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key, });
 static String id='otp page';

  @override
  Widget build(BuildContext context) {
        // ignore: unused_local_variable
        final verificationId = ModalRoute.of(context)?.settings.arguments;

    return  Scaffold(
      body: OtpPageBody(verificationId:verificationId.toString() ,),
    );
  }
}