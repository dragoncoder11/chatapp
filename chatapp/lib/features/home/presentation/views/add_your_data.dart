import 'package:flutter/material.dart';

class AddProfileData extends StatelessWidget {
  const AddProfileData({super.key});
  @override
  Widget build(BuildContext context) {
    final GlobalKey formkey=GlobalKey<FormState>();

    return Scaffold(
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            CircleAvatar(radius: MediaQuery.of(context).size.height*.1,
            child: Icon(Icons.add_a_photo),),
            SizedBox(height: 20,),
            TextFormField(
              
            )
            
          ],),
        ),
      ),
    );
  }
}