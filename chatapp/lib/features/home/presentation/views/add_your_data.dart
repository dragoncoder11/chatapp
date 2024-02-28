import 'package:chatapp/core/utils/constants.dart';
import 'package:chatapp/core/utils/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddProfileData extends StatelessWidget {
  const AddProfileData({Key? key}) : super(key: key);

  static String id = 'add profile data';

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController firstnameController = TextEditingController();
    TextEditingController lastnameController = TextEditingController();

    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 150),
              GestureDetector(
                onTap: () {
                  
                },
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.height * .1,
                  child: Icon(Icons.add_a_photo, size: 50),
                  backgroundColor: Color.fromARGB(255, 17, 52, 113),
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Field is required';
                  }
                  return null;
                },
                controller: firstnameController,
                decoration: InputDecoration(
                  hintText: 'Enter your first name',
                  contentPadding: EdgeInsets.all(20),
                  fillColor: kgreycolor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: lastnameController,
                decoration: InputDecoration(
                  hintText: 'Enter your last name',
                  contentPadding: EdgeInsets.all(20),
                  fillColor: kgreycolor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 40),  // Add a SizedBox with a fixed height
              CustomButton(
               
                title: 'Save',
                color: Colors.blue, ontap: () {  
                    if (formKey.currentState!.validate()) {
                    // Perform save action
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}