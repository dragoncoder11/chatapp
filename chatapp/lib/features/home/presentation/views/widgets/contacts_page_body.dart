import 'package:chatapp/core/utils/constants.dart';
import 'package:chatapp/core/utils/custom_appbar.dart';
import 'package:chatapp/core/utils/custom_button.dart';
import 'package:chatapp/core/utils/custom_text_field.dart';
import 'package:chatapp/core/utils/search_text_field.dart';
import 'package:chatapp/features/home/presentation/views/widgets/contact_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContactsPageBody extends StatelessWidget {
   ContactsPageBody({super.key});
  TextEditingController namecontroller=TextEditingController();
    TextEditingController phonecontroller=TextEditingController();
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
                child: Column(
                  children: [
                    Expanded(
                      child: Column(children: [
                       const SizedBox(height: 30,),
                        CustomTextField(controller: namecontroller, hint: 'name',type:TextInputType.text ,),
                        CustomTextField(controller: phonecontroller, hint: 'phoneNumber',type:TextInputType.phone ,),
                      ],),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomButton(ontap: (){}, title: 'Add',color: kgreycolor,),
                    )
                  ],
                ),);
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
