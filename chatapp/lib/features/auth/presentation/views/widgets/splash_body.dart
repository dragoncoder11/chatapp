import 'package:chatapp/core/utils/styles.dart';
import 'package:chatapp/features/auth/presentation/views/login_page.dart';
import 'package:chatapp/features/home/presentation/views/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3),(){
    FirebaseAuth.instance.currentUser!=null? Navigator.of(context).pushReplacementNamed(HomePage.id):Navigator.of(context).pushReplacementNamed(LoginPage.id);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
        Image.asset('assets/c.png',height: MediaQuery.of(context).size.height*.1,width: MediaQuery.of(context).size.width*.5,),
       const SizedBox(height: 40,),
       Text('Chatooo',style: Styles.styles24bold.copyWith(fontSize: 42,),)
      ],),
    );
  }
}