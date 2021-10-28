import 'dart:io';

import 'package:firstdart/config/constant.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PackageImages extends StatefulWidget {
  const PackageImages({ Key? key }) : super(key: key);

  @override
  _PackageImagesState createState() => _PackageImagesState();
}

class _PackageImagesState extends State<PackageImages> {

  dynamic file;

  Future<void> openCamera() async{
    var picker = ImagePicker();
    var photo = await picker.pickImage(source: ImageSource.camera);
    
    setState(() {
      file = File(photo!.path);
    });

    print(file);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Images'
        ),
      ),
      body: Center(
        child: file == null ? Text('Select Image') : Image.file(file),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print('Open Camera');
          openCamera();
        },
        child: Icon(
          Icons.camera,
        ),
        backgroundColor: pColor,
      ),
    );
  }
}