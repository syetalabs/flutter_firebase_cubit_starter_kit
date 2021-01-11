import 'package:flutter/material.dart';

class ImageUploadScreen extends StatelessWidget {
  static const routeName = '/image-upload-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Image Upload'),
      ),
    );
  }
}
