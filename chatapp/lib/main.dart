import 'package:chatapp/core/utils/constants.dart';
import 'package:chatapp/features/home/presentation/views/add_your_data.dart';
import 'package:chatapp/features/home/presentation/views/display_contacts.dart';
import 'package:chatapp/features/auth/presentation/views/login_page.dart';
import 'package:chatapp/features/auth/presentation/views/otp_page.dart';
import 'package:chatapp/features/auth/presentation/views/splash.dart';
import 'package:chatapp/features/home/presentation/views/chat_view_inside.dart';
import 'package:chatapp/features/home/presentation/views/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor,),
      routes: {
      SplashScreen.id:(context) => const SplashScreen(),
      LoginPage.id:(context) => const LoginPage(),
      OtpPage.id:(context) => const OtpPage(),
       HomePage.id:(context) => const HomePage(),
       DisplayContacts.id:(context) =>  DisplayContacts(),
      ChatViewInside.id:(context) => const ChatViewInside(),
       AddProfileData.id:(context) => const AddProfileData(),
      },
      initialRoute: AddProfileData.id,
     );
  }
}
