import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_imagevideo_picker/screens/detailscreen/widget/custom_image.dart';
import 'package:flutter_imagevideo_picker/screens/detailscreen/widget/custom_video.dart';
import 'package:flutter_imagevideo_picker/screens/detailscreen/widget/list_widget.dart';
import 'package:flutter_imagevideo_picker/screens/maiscreen/widget/custom_media_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  const DetailScreen(this.dataType, this.data);

  // ignore: prefer_typing_uninitialized_variables
  final dataType, data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'ImageVideo Picker',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back),
          ),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  ((dataType as ResultType) == ResultType.VIDEO_PATH) ? 'Video' : 'Images',
                  style: const TextStyle(fontSize: 20.0, color: Color(0xff00AFF0)),
                ),
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 24,
              ),
              if ((dataType as ResultType) == ResultType.IMAGE_PATH) CustomImage(data as File),
              if ((dataType as ResultType) == ResultType.IMAGE_ARRAY)
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate((data as List<Asset>).length, (index) {
                      return ListWidget((data as List<Asset>)[index]);
                    }),
                  ),
                ),
              if ((dataType as ResultType) == ResultType.VIDEO_PATH) CustomVideo(data as File)
            ],
          ),
        ));
  }
}
