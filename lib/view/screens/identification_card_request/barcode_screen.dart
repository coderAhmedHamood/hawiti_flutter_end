import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:barcode/barcode.dart';

import '../../../model/id_card_request_result.dart';
class BarcodeScreen extends StatelessWidget {
  IdCardRequestResult model;
   BarcodeScreen({super.key,required this.model});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('الباركود الخاص بالطلب',textAlign: TextAlign.center,),
      ),
body: Container(
  child:   Column(
    children: [
      const SizedBox(height: 20,),

      Text('قم بأخذ لقطة شاشة وأرسلها  للشهود لتوثيق طلبك',style: TextStyle(fontSize: 20,fontFamily: 'No',fontWeight: FontWeight.bold),),
      const SizedBox(height: 100,),
      Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
              width: 3,
            ),
          ),
          child: BarcodeWidget(
            margin: EdgeInsets.all(5),
            color: Colors.black,
            barcode: Barcode.qrCode(
              errorCorrectLevel: BarcodeQRCorrectionLevel.high,
            ),
            data: model.data.barcode,
            width: 300,
            height: 300,
          ),
        ),
      ),
    ],
  ),
),
    );
  }
}
// ignore_for_file: always_specify_types



void buildBarcode(
    Barcode bc,
    String data, {
      String? filename,
      double? width,
      double? height,
      double? fontHeight,
    }) {
  /// Create the Barcode
  final svg = bc.toSvg(
    data,
    width: width ?? 200,
    height: height ?? 80,
    fontHeight: fontHeight,
  );

  // Save the image
  filename ??= bc.name.replaceAll(RegExp(r'\s'), '-').toLowerCase();
  File('$filename.svg').writeAsStringSync(svg);
}

