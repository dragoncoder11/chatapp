import 'package:chatapp/features/auth/presentation/views/widgets/otp_page_body.dart';
import 'package:flutter/material.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key, });
 static String id='otp page';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OtpPageBody(),
    );
  }
}