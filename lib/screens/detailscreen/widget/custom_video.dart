import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CustomVideo extends StatefulWidget {
  const CustomVideo(this.data);

  // ignore: prefer_typing_uninitialized_variables
  final File data;

  @override
  _CustomVideoState createState() => _CustomVideoState();
}

class _CustomVideoState extends State<CustomVideo> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    //init controller
    _controller = VideoPlayerController.file(widget.data)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  //Image thumbnail widget
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return _controller.value.initialized
        ? Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.3,
                  child: VideoPlayer(_controller),
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
              Positioned(
                right: 0,
                top: 0,
                left: 0,
                bottom: 0,
                child: Image.asset(
                  'assets/images/ic_play.png',
                  height: 28,
                  width: 28,
                ),
              )
            ],
          )
        : Container();
  }
}
