import 'package:chatapp/features/home/presentation/views/widgets/contacts_page_body.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ContactsPageBody(),
    );
  }
}