import 'package:flutter/material.dart';
import 'package:petstagram/utils/colors.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      color: mobileBackgroundColor,
      padding: const EdgeInsets.symmetric(),
      );
  }
}