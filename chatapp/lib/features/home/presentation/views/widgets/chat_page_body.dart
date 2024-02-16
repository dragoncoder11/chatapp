import 'package:chatapp/core/utils/custom_appbar.dart';
import 'package:chatapp/core/utils/search_text_field.dart';
import 'package:chatapp/features/home/presentation/views/widgets/chat_item.dart';
import 'package:chatapp/features/home/presentation/views/widgets/story_card_item.dart';
import 'package:flutter/material.dart';

class ChatPageBody extends StatelessWidget {
  const ChatPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SafeArea(
        child:  Column(
          children: [
            CustomAppbar(ontap: (){}, icon: Icons.chat, title: 'Chats'),
           const SizedBox(height: 32,),
            SizedBox(height: 90,
              child: ListView.builder(scrollDirection: Axis.horizontal,itemBuilder: (context,index){
                  return const StoryCardItem();
                }),
            ),
           const SizedBox(height: 20,),
           const SearchTextField(),
           const SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(itemBuilder: (context,index){
                return const ChatItem();
              }),
            ),
          ],
        ),
      ),
    );
  }
}