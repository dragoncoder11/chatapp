import 'package:chatapp/core/utils/custom_appbar.dart';
import 'package:chatapp/core/utils/search_text_field.dart';
import 'package:chatapp/features/home/presentation/views/display_contacts.dart';
import 'package:chatapp/features/home/presentation/views/widgets/chat_item.dart';
import 'package:chatapp/features/home/presentation/views/widgets/story_card_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPageBody extends StatefulWidget {
  const ChatPageBody({Key? key}) : super(key: key);

  @override
  State<ChatPageBody> createState() => _ChatPageBodyState();
}
class _ChatPageBodyState extends State<ChatPageBody> {
  late List chatlist = [];

  Future<void> getChats() async {
    final response = await FirebaseFirestore.instance
        .collection('contacts')
        .where('message', isGreaterThan: [])
        .get();
    setState(() {
      chatlist = response.docs;
        
    });
  }

  @override
  void initState() {
    getChats();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SafeArea(
        child: Column(
          children: [
            CustomAppbar(
              icon: Icons.chat,
              title: 'Chats',
              ontap: () {
                Navigator.of(context).pushNamed(DisplayContacts.id);
              },
            ),
            const SizedBox(height: 32),
            SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const StoryCardItem();
                },
              ),
            ),
            const SizedBox(height: 20),
            const SearchTextField(),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: chatlist.length,
                itemBuilder: (context, index) {
                  return ChatItem(name: '${chatlist[index]['name']}');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}