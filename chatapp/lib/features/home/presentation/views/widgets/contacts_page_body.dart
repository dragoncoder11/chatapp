import 'package:chatapp/core/utils/custom_appbar.dart';
import 'package:chatapp/core/utils/search_text_field.dart';
import 'package:chatapp/features/home/presentation/views/widgets/contact_item.dart';
import 'package:flutter/material.dart';

class ContactsPageBody extends StatelessWidget {
  const ContactsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SafeArea(
        child:  Column(
          children: [
            CustomAppbar(ontap: (){}, icon: Icons.add, title: 'Contacts'),
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
