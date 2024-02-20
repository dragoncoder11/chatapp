import 'package:chatapp/core/utils/constants.dart';
import 'package:chatapp/features/home/presentation/views/widgets/chat_view_inside_body.dart';
import 'package:flutter/material.dart';

class ChatViewInside extends StatelessWidget {
  const ChatViewInside({super.key, });
static const id='chat view inside';

  @override
  Widget build(BuildContext context) {
          final  routearg=ModalRoute.of(context)?.settings.arguments as Map;
          final name=routearg['name'];
          final id=routearg['id'];

    return  Scaffold(
      backgroundColor:const Color(0xff152033),
      appBar: AppBar(title: Text(name),backgroundColor:kPrimaryColor ,),
      body: ChatViewInsideBody(uid: id,) ,
    );
  }
}