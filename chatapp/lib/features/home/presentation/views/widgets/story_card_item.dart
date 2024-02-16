import 'package:chatapp/core/utils/styles.dart';
import 'package:flutter/material.dart';

class StoryCardItem extends StatelessWidget {
  const StoryCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(right: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 60,width: 60,
              decoration: BoxDecoration(image:const DecorationImage(image: AssetImage('assets/c.png'),fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.blue,width: 1.5),
              ),
            ),
            const SizedBox(height: 3,),
           const Text('Your Story',style: Styles.styles10w400,)
          ],
        ),
      ),
    );
  }
}