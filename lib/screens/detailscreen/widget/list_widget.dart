import 'dart:io';

import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class ListWidget extends StatelessWidget {
  const ListWidget( this.data);

  // ignore: prefer_typing_uninitialized_variables
  final Asset data;

  // list image item for multiple image selection
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AssetThumb(
            asset: data,
            width: 300,
            height: 180,
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
