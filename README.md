# Flutter - Custom MediaPicker

A Flutter based Reusable component which provides MediaPicker with custom properties which can be used in any flutter application.


## Table of contents
- [Flutter Support](#flutter-support)
- [Demo](#demo)
- [Features](#features)
- [Getting started](#getting-started)
- [Usage](#usage)
- [Methods](#methods)
- [Directive options](#directive-options)
- [Want to Contribute?](#want-to-contribute)
- [Need Help / Support?](#need-help)
- [Collection of Components](#collection-of-Components)
- [Changelog](#changelog)
- [License](#license)
- [Keywords](#Keywords)


## Flutter Support

Version - Flutter 1.17 (stable)

We have tested our program in above version, however you can use it in other versions as well


## Demo
[![](wli_mediapicker.gif)](https://github.com/weblineindia/Flutter-Custom-MediaPicker/blob/master/wli_mediapicker.gif)

------

## Features

* Customisable MediaPicker with image and video.

* Common widget can be used for pick image, pick multiple images, pick video based on Type.

## Getting started

* Download this sample project and import custom_media_picker.dart file in your project..
* Update Widgets UI based on your requirements.


## Usage

Setup process is described below to integrate in project.

### Methods

Add below pub dev libraries

    //Put this libraries
      image_picker: ^0.6.7+4
      multi_image_picker: ^4.7.10

    //fire below command to sync libraries
      pub get

Configure CustomMediaPicker Widget

    //Put CustomMediaPicker Widget
      CustomMediaPicker()

Pass required properties

    //add child widget as per UI requirement
    //add picker type which identify to pick image or video
    //resource callback will accept future void method with two param
      CustomMediaPicker(
            childWidget: Image.asset(
                         'assets/images/ic_img.png',
                         height: screenHeight * 0.25),
            pickerType: PickerType.IMAGE,
            resourceCallback: resourceCallback,
    )


Available PickerType

      //required parameter to identify pick image or video
        PickerType.IMAGE //pick image
        PickerType.VIDEO //pick video

Available ResultType

      ResultType.IMAGE_PATH  //File value
      ResultType.VIDEO_PATH  //File value
      ResultType.IMAGE_ARRAY //List of assets

Available PickSource

      PickSource.CAMERA  //open camera
      PickSource.GALLERY  //open gallery
      PickSource.CHOOSE //open bottomSheet and will allow user to choose b/w image and gallery

Callback function

    //required parameter with future void method
      Future<void> resourceCallback(ResultType resultType,resourceData) async {
        //result type will identify resourceData type
        //you can typecast resource data and use as per your requirement
      }


Set below properties based on your requirements

    //optional property to pick from camera or gallery
    //default value will be PickSource.CAMERA
      pickSource: PickSource.CHOOSE,

    //optional property to select multiple image
    //it accepts boolean value, default value will be false
      isMultipleImage: true,

    //optional property for set max image limit
    //this property will use only when isMultipleImage is true
    //it accepts int, default value will be 2
      maxImageCount: 10,

    //optional property for set max video duration
    //this property will use only when picker type is PickerType.VIDEO
    //it accepts duration object, default will be  300 sec
      maxVideoDuration: this.maxVideoDuration = const Duration(seconds: 800),

    //optional property for set camera option
    //this property will use only when picker source is PickSource.CAMERA
    //it will accept CameraType object and default will be CameraDevice.rear
      this.preferredCameraDevice = CameraDevice.rear,

------

## Directive options

### iOS

    //Add the following keys to your Info.plist file, located in <project root>/ios/Runner/Info.plist:
    - NSPhotoLibraryUsageDescription - describe why your app needs permission for the photo library.
      This is called Privacy - Photo Library Usage Description in the visual editor.
    - NSCameraUsageDescription - describe why your app needs access to the camera.
      This is called Privacy - Camera Usage Description in the visual editor.
    - NSMicrophoneUsageDescription - describe why your app needs access to the microphone,
      if you intend to record videos. This is called Privacy - Microphone Usage Description in the visual editor.

### Android

    //API 29+
    - Add android:requestLegacyExternalStorage="true" as an attribute to the <application> tag in AndroidManifest.xml.
      The attribute is false by default on apps targeting Android Q.

------

## Want to Contribute?

- Created something awesome, made this code better, added some functionality, or whatever (this is the hardest part).
- [Fork it](http://help.github.com/forking/).
- Create new branch to contribute your changes.
- Commit all your changes to your branch.
- Submit a [pull request](http://help.github.com/pull-requests/).

------

## Need Help?
If you need help then feel free to contact our [Flutter developers](https://www.weblineindia.com/flutter-cross-platform-mobile-app-development.html).

 ------

## Collection of Components
 We have built many other components and free resources for software development in various programming languages. Kindly click here to view our [Free Resources for Software Development.](https://www.weblineindia.com/software-development-resources.html)

------

## Changelog
Detailed changes for each release are documented in [CHANGELOG](./CHANGELOG).

## License

[MIT](LICENSE)

[mit]: https://github.com/weblineindia/Flutter-Custom-MediaPicker/blob/master/LICENSE

## Keywords
Flutter Media Picker, Image Picker, Video Picker, Multiple Image Selection, Media Picker Demo, Weblineindia
