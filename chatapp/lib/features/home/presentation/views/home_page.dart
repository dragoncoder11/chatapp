import 'package:chatapp/core/utils/constants.dart';
import 'package:chatapp/features/home/presentation/views/chat_page.dart';
import 'package:chatapp/features/home/presentation/views/contacts_page.dart';
import 'package:chatapp/features/home/presentation/views/more_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
static String id='home page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
int selectedIndex=0;
final listpages=const[
 ContactsPage(),
 ChatPage(),
 MorePage()
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        backgroundColor: kPrimaryColor,
      currentIndex: selectedIndex,
      onTap: (value) {
        selectedIndex=value;
        setState(() {
          
        });
      },
        items: const
      [
        BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Contacts',),      
        BottomNavigationBarItem(icon: Icon(Icons.chat),label: 'Chats',),
        BottomNavigationBarItem(icon: Icon(Icons.more_horiz),label: 'More',),
      ],
      ),
      body: listpages.elementAt(selectedIndex),
    );
  }
}