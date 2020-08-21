import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

// ignore: must_be_immutable
class CustomMediaPicker extends StatelessWidget {
  CustomMediaPicker(
      {@required this.childWidget,
      @required this.pickerType,
      @required this.resourceCallback,
      this.pickSource = PickSource.CAMERA,
      this.isMultipleImage = false,
      this.maxImageCount = 2,
      this.maxVideoDuration = const Duration(seconds: 300),
      this.preferredCameraDevice = CameraDevice.rear});

  //customizable parameters
  final Widget childWidget;
  final PickerType pickerType;
  PickSource pickSource;
  final bool isMultipleImage;
  final int maxImageCount;
  final Function resourceCallback;
  final Duration maxVideoDuration;
  final CameraDevice preferredCameraDevice;

  //picker initialization
  var picker = ImagePicker();

  //method for pick images
  Future getImage() async {
    final imageData = await picker.getImage(
      source: pickSource == PickSource.CAMERA ? ImageSource.camera : ImageSource.gallery,
      preferredCameraDevice: preferredCameraDevice,
    );
    if (imageData != null) {
      resourceCallback(ResultType.IMAGE_PATH, File(imageData.path));
    }
  }

  //method for pick video
  Future getVideo() async {
    final videoData = await picker.getVideo(
        source: pickSource == PickSource.CAMERA ? ImageSource.camera : ImageSource.gallery,
        preferredCameraDevice: preferredCameraDevice,
        maxDuration: maxVideoDuration);
    if (videoData != null) {
      resourceCallback(ResultType.VIDEO_PATH, File(videoData.path));
    }
  }

  //method for pick multiple images
  Future<void> getMultipleImage() async {
    List<Asset> imageArray = <Asset>[];
    try {
      imageArray = await MultiImagePicker.pickImages(
        maxImages: maxImageCount,
        enableCamera: true,
        cupertinoOptions: const CupertinoOptions(takePhotoIcon: 'chat'),
        materialOptions: const MaterialOptions(
          actionBarColor: '#FDBC33',
          actionBarTitle: 'WeblineIndia',
          allViewTitle: 'All Photos',
          useDetailsView: false,
          selectCircleStrokeColor: '#000000',
        ),
      );
    } on Exception catch (e) {
      print(e.toString());
    }
    if (imageArray.isNotEmpty) resourceCallback(ResultType.IMAGE_ARRAY, imageArray);
  }

  //handle picker click
  void _handlePicker(BuildContext context) {
    if (isMultipleImage) {
      getMultipleImage();
    } else if (pickSource == PickSource.CHOOSE) {
      _settingModalBottomSheet(context);
    } else if (pickerType == PickerType.IMAGE) {
      getImage();
    } else if (pickerType == PickerType.VIDEO) {
      getVideo();
    }
  }

  //buid method for render ui
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handlePicker(context),
      child: childWidget,
    );
  }

  //bottomsheet layout for choose b/w camera ad gallery
  void _settingModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: const Color(0x00000000),
        builder: (BuildContext bc) {
          return Container(
            height: 240,
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
              color: Colors.white,
            ),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Choose From',
                    style: TextStyle(fontSize: 24.0, color: Color(0xff00AFF0), fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 44,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        pickSource = PickSource.CAMERA;
                        if (pickerType == PickerType.IMAGE) {
                          getImage();
                        } else if (pickerType == PickerType.VIDEO) {
                          getVideo();
                        }
                      },
                      child: Column(
                        children: [
                          Image.asset('assets/images/ic_camera.png', height: 48),
                          const SizedBox(height: 8.0),
                          const Text('Camera', style: TextStyle(fontSize: 18.0))
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        pickSource = PickSource.GALLERY;
                        if (pickerType == PickerType.IMAGE) {
                          getImage();
                        } else if (pickerType == PickerType.VIDEO) {
                          getVideo();
                        }
                      },
                      child: Column(
                        children: [
                          Image.asset('assets/images/ic_gallery.png', height: 48),
                          const SizedBox(height: 8.0),
                          const Text('Gallery', style: TextStyle(fontSize: 18.0))
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}

//enum for pick image or video
enum PickerType { IMAGE, VIDEO }
//eum for pick from camera or gallery or choose from both
enum PickSource { CAMERA, GALLERY, CHOOSE }
//eum for result type
enum ResultType { IMAGE_PATH, VIDEO_PATH, IMAGE_ARRAY }
