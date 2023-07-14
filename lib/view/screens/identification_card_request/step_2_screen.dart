import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class StepTwoScreen extends StatefulWidget {
  const StepTwoScreen({Key? key}) : super(key: key);

  @override
  State<StepTwoScreen> createState() => _StepTwoScreenState();
}

class _StepTwoScreenState extends State<StepTwoScreen> {
  final picker = ImagePicker();
  PickedFile? _imageFile;

  void _openCamera() async {
    final pickedFile  = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      _imageFile = pickedFile as PickedFile?;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Screen'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Column 4',
                style: TextStyle(
                  fontFamily: 'NotoKufiArabic',
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: _openCamera,
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: Colors.white60,
                border: Border.all(width: 2),
              ),
              width: double.infinity,
              height: 40,
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.camera_alt,
                    size: 30,
                    weight: 1,
                  ),
                  Text(
                    'Take a Photo',
                    style: TextStyle(
                      fontFamily: 'NotoKufiArabic',
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_imageFile != null)
            Container(
              margin: const EdgeInsets.all(10),
              child: Image.file(
                File(_imageFile!.path),
                fit: BoxFit.cover,
                width: 200,
                height: 200,
              ),
            ),
        ],
      ),
    );
  }
}