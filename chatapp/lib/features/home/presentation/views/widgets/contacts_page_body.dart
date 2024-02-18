import 'package:chatapp/core/utils/constants.dart';
import 'package:chatapp/core/utils/custom_appbar.dart';
import 'package:chatapp/core/utils/custom_button.dart';
import 'package:chatapp/core/utils/custom_text_field.dart';
import 'package:chatapp/core/utils/search_text_field.dart';
import 'package:chatapp/features/home/presentation/views/widgets/contact_item.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactsPageBody extends StatefulWidget {
   ContactsPageBody({super.key});

  @override
  State<ContactsPageBody> createState() => _ContactsPageBodyState();
}
class _ContactsPageBodyState extends State<ContactsPageBody> {
  TextEditingController namecontroller=TextEditingController();

    TextEditingController phonecontroller=TextEditingController();

    CollectionReference contacts = FirebaseFirestore.instance.collection('contacts');
            GlobalKey formkey=GlobalKey<FormState>();
    Future<void> addUser() async {
       if (formkey.currentState!.validate()) {
      try {
        await contacts.add({
          'name': namecontroller.text,
          'phone': phonecontroller.text,
        });
        print("User Added");
      } catch (error) {
        print("Failed to add user: $error");
      }
    }
    }

  @override
 void dispose() {
namecontroller.dispose();
    phonecontroller.dispose();   
     super.dispose();
  }
  @override
  
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(24),
      child: SafeArea(
        child:  Column(
          children: [
            CustomAppbar(ontap: (){
              showModalBottomSheet(backgroundColor:Colors.black,context: context, builder: (context){
                return SizedBox(height: MediaQuery.of(context).size.height*.5,
                              
                    
                     child:   Form(
                      key: formkey,
                       child: ListView(children: [
                         const SizedBox(height: 30,),
                          CustomTextField(controller: namecontroller, hint: 'name',),
                          CustomTextField(controller: phonecontroller, hint: 'phoneNumber',),
                            const SizedBox(height: 100,),
                               Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CustomButton(ontap: (){
                      addUser();
                      namecontroller.clear();
                      phonecontroller.clear();
                        }, title: 'Add',color: kgreycolor,),
                                 
                                       ),
                        ],),
                     ),
                    
                   );
              });
            }, icon: Icons.add, title: 'Contacts'),
           const SizedBox(height: 32,),
           const SearchTextField(),
           const SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(itemBuilder: (context,index){
                return const ContactItem();
              }),
            ),
          ],
        ),
      ),
    );
  
  }
}
