import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../controllers/verify_controller.dart';

class ReadQR extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ReadQRState();
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  VerifyController verController = Get.put(VerifyController());

  double cutOutSize = 300.0;
  bool isLoading = false;
  bool isReadingQR = true;
}

class _ReadQRState extends State<ReadQR> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  double cutOutSize = 200;
  bool isLoading = false;
  bool isAlertDialogShown = false;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  void showQRData(String format, String? code) {
    setState(() {
      isAlertDialogShown = true;
      isLoading = false;
    });
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('تسجيل الحضور'),
        content: isLoading
            ? Container(
            height: 80, child: Center(child: CircularProgressIndicator()))
            : Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('تم تسجيل الحضور بنجاح:                 ${code ?? ''}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                isAlertDialogShown = false;
                isLoading = false;
                controller!.resumeCamera();
              });
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '',
          style: TextStyle(
            fontFamily: 'NotoKufiArabic',
          ),
        ),
        backgroundColor: Colors.indigo.shade900,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: _buildQrView(context),
          ),
          Column(
            children: [
              Expanded(
                child: Container(),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 190.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Slider(
                          value: cutOutSize,
                          min: 50,
                          max: 400,
                          inactiveColor: Colors.indigo.shade50,
                          activeColor: Colors.blue.shade500,
                          onChanged: (value) {
                            setState(() {
                              cutOutSize = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.white,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: cutOutSize,
      ),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      isLoading = true;
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      setState(() {
        result = scanData;
        print('qr result');
        print(result?.code);
        print(result?.format);
        // if(result.code.)

String request=result?.code??"";
print(request);
        VerifyController verController = Get.put(VerifyController());
          verController.addVerify(request);
          // controller.dispose();

        isLoading = false;
        controller.pauseCamera();
      });
      // showDialog(
      //   context: context,
      //   barrierDismissible: false,
      //   builder: (_) => WillPopScope(
      //     onWillPop: () async => false,
      //     child: Dialog(
      //       child: Container(
      //         height: 120,
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: const [
      //             CircularProgressIndicator(),
      //             SizedBox(height: 20),
      //             Text('جارٍ التحقق...'),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // );

      // await Future.delayed(Duration(seconds: 1));
      // isLoading = false;
      // Navigator.of(context, rootNavigator: true).pop('dialog');
      // showQRData(result!.format.toString(), result!.code);
      // setState(() {
      //   result = null;
      // });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');

    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}