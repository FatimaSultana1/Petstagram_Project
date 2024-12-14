import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petstagram/utils/colors.dart';
import 'package:petstagram/widgets/post_card.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              backgroundColor: mobileBackgroundColor,
              centerTitle: false,
              title: Image.asset(
                'assets/images/pet.png',
                // color: primaryColor,
                height: 32,
              ),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.messenger_outline,
                    color: primaryColor,
                  ),
                  onPressed: () {},
                ),
              ],
            ),

            body: const PostCard(),
    
    );
  }
}