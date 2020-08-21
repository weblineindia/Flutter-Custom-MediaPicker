import 'dart:io';

import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage( this.data);

  // ignore: prefer_typing_uninitialized_variables
  final File data;

  //custom image
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.file(
            data,
            width: screenWidth * 0.9,
            height: screenHeight * 0.3,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Image.asset(
            'assets/images/ic_close.png',
            height: 28,
            width: 28,
          ),
        ),
      ],
    );
  }
}
