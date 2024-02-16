import 'package:chatapp/features/home/presentation/views/widgets/chat_page_body.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChatPageBody(),
    );
  }
}