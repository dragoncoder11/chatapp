import 'package:chatapp/features/auth/presentation/views/widgets/login_page_body.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, });
 static String id='login page';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: LoginPageBody(),
    );
  }
}