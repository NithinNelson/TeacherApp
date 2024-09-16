import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:teacherapp/View/CWidgets/TeacherAppPopUps.dart';
import 'package:teacherapp/View/MorePage/scanData.dart';

import '../../Controller/api_controllers/qrController.dart';
import '../../Models/api_models/qr_clinic_model.dart';
import '../../Services/api_services.dart';

class QRViewExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? qrText;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: (QRViewController qrController) {
                _onQRViewCreated(qrController, context);
              },
              overlay: QrScannerOverlayShape(
                borderColor: Colors.white,
                borderRadius: 20,
                borderLength: 30,
                borderWidth: 12,
                cutOutBottomOffset: 20,
                cutOutSize: 300,
                overlayColor: Colors.black.withOpacity(0.5),
              ),

            ),
          ),
          // Expanded(
          //   flex: 1,
          //   child: Center(
          //     child: Text('Scan result: $qrText'),
          //   ),
          // )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller, BuildContext mainContext) async {
    print("....................................");

    controller.scannedDataStream.listen((scanData) async {
      print(".qrData:.........................${scanData.code}");
      if (scanData.code != null) {
        print("..........................$scanData");
        await Get.find<Qrcontroller>().fetchQrData(qrCode: scanData.code.toString().trim());
        // if(!mounted) return;
        if(Get.find<Qrcontroller>().studentqrdata.value.admnNo != null) {
          Navigator.of(mainContext).pushReplacement(MaterialPageRoute(builder: (context) => const Scandata()));

        }
        else {
          Navigator.of(context).pop();

          TeacherAppPopUps.submitFailed(
              title: "Failed",
              message:"Invalid QR Code",
              actionName: "Ok",
              iconData: Icons.error_outline,
              iconColor: Colors.red);        }

      }
    });
  }

  // void _onQRViewCreated(QRViewController controller) {
  //   this.controller = controller;
  //   controller.scannedDataStream.listen((scanData) {
  //     setState(() {
  //       qrText = scanData.code;
  //     });
  //   });
  // }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
