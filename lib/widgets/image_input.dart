import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  @override
  State<ImageInput> createState() {
    return _ImageInputState();
  }
}

class _ImageInputState extends State<ImageInput> {

  File? _selectedImage;

  takePicture() async {
    final imagePicker = ImagePicker();
    final pickerImage =
        await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);

    if (pickerImage == null) {
      return;
    }

     setState(() {
      _selectedImage = File(pickerImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
    decoration:
        BoxDecoration(border: Border.all(width: 1, color: Colors.white)),
    height: 250,
    width: double.infinity,
    alignment: Alignment.center,
    child: _selectedImage != null
    ? GestureDetector(
      onTap: takePicture,
      child:  Image.file(
        _selectedImage!,
        fit: BoxFit.cover,
        width: double.infinity,
        height:  double.infinity,
      ),
    )
    : TextButton.icon(
      label: Text('Take Picture'),
      icon: Icon(Icons.camera),
      onPressed: takePicture,
    ),
  );
  }
}
