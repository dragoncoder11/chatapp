import 'package:chatapp/core/utils/search_text_field.dart';
import 'package:chatapp/features/home/presentation/views/chat_view_inside.dart';
import 'package:chatapp/features/home/presentation/views/widgets/contact_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DisplayContacts extends StatefulWidget {
  const DisplayContacts({super.key});
   static String id='display contacts';

  @override
  State<DisplayContacts> createState() => _DisplayContactsState();
}

class _DisplayContactsState extends State<DisplayContacts> {

  final contactlist=[];

 getData()async{
    var response =await FirebaseFirestore.instance.collection('contacts').get();
      contactlist.addAll(response.docs);
      setState(() {
        
      });
    }
    @override
  void initState() {
   getData();
    super.initState();
  }
    
  @override
  
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          const SizedBox(height: 80,),
             const SearchTextField(),
             const SizedBox(height: 20,),
              Expanded(
                child: ListView.builder(itemCount: contactlist.length,itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(ChatViewInside.id,arguments:{'name':'${contactlist[index]['name']}','id':contactlist[index].id});
                    },
                  child: ContactItem(name: '${contactlist[index]['name']}', phone: '${contactlist[index]['phone']}'));
                }),
              ),
        ],),
      )
    );
  }
}