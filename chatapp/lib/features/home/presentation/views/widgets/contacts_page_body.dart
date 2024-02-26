import 'package:chatapp/core/utils/constants.dart';
import 'package:chatapp/core/utils/custom_appbar.dart';
import 'package:chatapp/core/utils/custom_button.dart';
import 'package:chatapp/core/utils/custom_text_field.dart';
import 'package:chatapp/core/utils/search_text_field.dart';
import 'package:chatapp/features/home/presentation/views/widgets/contact_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactsPageBody extends StatefulWidget {
   ContactsPageBody({super.key,  this.image='assets/default.jpg'});
    final String image;

  @override
  State<ContactsPageBody> createState() => _ContactsPageBodyState();
}

class _ContactsPageBodyState extends State<ContactsPageBody> {
 TextEditingController namecontroller=TextEditingController();

    TextEditingController phonecontroller=TextEditingController();

    CollectionReference contacts = FirebaseFirestore.instance.collection('contacts');

            GlobalKey formkey=GlobalKey<FormState>();

    Future<void> addUser() async {
       
      try {
        await contacts.add({
          'name': namecontroller.text,
          'phone': phonecontroller.text,
          'id': FirebaseAuth.instance.currentUser!.uid
        //  'image':widget.image,
        });
        print("User Added");
      } catch (error) {
        print("Failed to add user: $error");
      }
    
    }

    final Stream<QuerySnapshot> contactstream = FirebaseFirestore.instance.collection('contacts').where('id',isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots();

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
                          CustomTextField(controller: phonecontroller, hint: 'phoneNumber', ),
                            const SizedBox(height: 100,),
                               Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CustomButton(ontap: ()async{
                       
                           addUser();
                      namecontroller.clear();
                      phonecontroller.clear();
                      Navigator.pop(context);      
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
           StreamBuilder<QuerySnapshot>(stream: contactstream, builder: (context,AsyncSnapshot<QuerySnapshot>snapshot){
            if(snapshot.hasError){
              return Center(child: Text('error'),);
            }
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            return  Expanded(
              child: ListView.builder(physics:const BouncingScrollPhysics() ,itemCount: snapshot.data!.docs.length,itemBuilder: (context,index){
                return  ContactItem(/* image:'${contactlist[index]['image']}', */ name: '${snapshot.data!.docs[index]['name']}', phone: '${snapshot.data!.docs[index]['phone']}');
              }),
            );
           })
          ],
        ),
      ),
    );
  
  }
}
