import 'package:chatapp/core/utils/search_text_field.dart';
import 'package:chatapp/features/home/presentation/views/chat_view_inside.dart';
import 'package:chatapp/features/home/presentation/views/widgets/contact_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class DisplayContacts extends StatelessWidget {
   DisplayContacts({super.key});
   static String id='display contacts';

    final Stream<QuerySnapshot> contactstream = FirebaseFirestore.instance.collection('contacts').where('id',isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots();

  @override
  
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          const SizedBox(height: 80,),
             const SearchTextField(),
             const SizedBox(height: 20,),
            StreamBuilder(stream: contactstream, builder: (context,snapshot){
              if(snapshot.hasError){
                return Center(child: Text('error'),);
              }
               if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
              return   Expanded(
                child: ListView.builder(itemCount: snapshot.data!.docs.length,itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(ChatViewInside.id,arguments:{'name':'${snapshot.data!.docs[index]['name']}','id':snapshot.data!.docs[index].id});
                    },
                  child: ContactItem(name: '${snapshot.data!.docs[index]['name']}', phone: '${snapshot.data!.docs[index]['phone']}'));
                }),
              );
            })
        ],),
      )
    );
  }
}