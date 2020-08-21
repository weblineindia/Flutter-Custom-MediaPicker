import 'package:flutter/material.dart';
import 'package:flutter_imagevideo_picker/screens/detailscreen/detail_screen.dart';
import 'package:flutter_imagevideo_picker/screens/maiscreen/widget/custom_media_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Asset> images = <Asset>[];
  final picker = ImagePicker();


  Future<void> resourceCallback(ResultType resultType,resourceData) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailScreen(resultType, resourceData)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ImageVideo Picker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomMediaPicker(
                      pickerType: PickerType.IMAGE,
                      pickSource: PickSource.CHOOSE,
                      isMultipleImage: true,
                      maxImageCount: 10,
                      resourceCallback: resourceCallback,
                      childWidget: Image.asset(
                        'assets/images/ic_img.png',
                        height: screenHeight * 0.25,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      'Select Images',
                      style: TextStyle(fontSize: 20.0, color: Color(0xff00AFF0)),
                    ),
                    const SizedBox(height: 8.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
                      child: const Text(
                        'Select single or multiple images from camera and gallery',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomMediaPicker(
                    pickerType: PickerType.VIDEO,
                    pickSource: PickSource.CHOOSE,
                    resourceCallback: resourceCallback,
                    childWidget: Image.asset(
                      'assets/images/ic_video.png',
                      height: screenHeight * 0.25,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Select Video',
                    style: TextStyle(fontSize: 20.0, color: Color(0xff00AFF0)),
                  ),
                  const SizedBox(height: 8.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
                    child: const Text(
                      'Select video from camera and gallery',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
