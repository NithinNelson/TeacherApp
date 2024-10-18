import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:teacherapp/View/MorePage/qr_scanner_overlay_shape.dart';
import 'package:teacherapp/View/MorePage/scanData.dart';
import 'package:teacherapp/View/MorePage/scanner_error_widget.dart';

import '../../Controller/api_controllers/qrController.dart';
import '../CWidgets/TeacherAppPopUps.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({super.key});

  @override
  State<QRViewExample> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  final MobileScannerController controller = MobileScannerController(
    formats: const [BarcodeFormat.qrCode],
    // detectionSpeed: DetectionSpeed.noDuplicates,
  );

  @override
  Widget build(BuildContext context) {
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.sizeOf(context).center(Offset.zero),
      width: 200,
      height: 200,
    );

    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   title: const Text('Scanner with Overlay Example app'),
      // ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: MobileScanner(
              fit: BoxFit.contain,
              controller: controller,
              scanWindow: scanWindow,
              onDetect: (BarcodeCapture barcodes) async {
                print(
                    ".qrData:.........................${barcodes.barcodes.first.displayValue}");
                if (barcodes.barcodes.first.displayValue != null) {
                  print(
                      "..........................${barcodes.barcodes.first.displayValue}");
                  await Get.find<Qrcontroller>().fetchQrData(
                      qrCode: barcodes.barcodes.first.displayValue
                          .toString()
                          .trim());
                  // if(!mounted) return;
                  if (Get.find<Qrcontroller>().studentqrdata.value.admnNo !=
                      null) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const Scandata()));
                  } else {
                    Navigator.of(context).pop();
                    TeacherAppPopUps.submitFailed(
                      title: "Failed",
                      message: "Invalid QR Code",
                      actionName: "Ok",
                      iconData: Icons.error_outline,
                      iconColor: Colors.red,
                    );
                  }
                }
              },
              errorBuilder: (context, error, child) {
                return ScannerErrorWidget(error: error);
              },
              // overlayBuilder: (context, constraints) {
              //   return Padding(
              //     padding: const EdgeInsets.all(16.0),
              //     child: Align(
              //       alignment: Alignment.bottomCenter,
              //       child: StreamBuilder(
              //         stream: controller.barcodes,
              //         builder: (context, snapshot) {
              //           final scannedBarcodes = snapshot.data?.barcodes ?? [];
              //
              //           if (scannedBarcodes.isEmpty) {
              //             return const Text(
              //               'Scan something!',
              //               overflow: TextOverflow.fade,
              //               style: TextStyle(color: Colors.white),
              //             );
              //           }
              //
              //           return Text(
              //             scannedBarcodes.first.displayValue ?? 'No display value.',
              //             overflow: TextOverflow.fade,
              //             style: const TextStyle(color: Colors.white),
              //           );
              //         },
              //       ),
              //     ),
              //   );
              // },
            ),
          ),
          ValueListenableBuilder(
            valueListenable: controller,
            builder: (context, value, child) {
              if (!value.isInitialized ||
                  !value.isRunning ||
                  value.error != null) {
                return const SizedBox();
              }

              return Container(
                decoration: ShapeDecoration(
                  shape: QrScannerOverlayShape(
                    borderColor: Colors.white,
                    borderRadius: 20,
                    borderLength: 30,
                    borderWidth: 12,
                    cutOutBottomOffset: 20,
                    cutOutSize: 300,
                    overlayColor: Colors.black.withOpacity(0.5),
                  ),
                ),
              );
            },
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Padding(
          //     padding: const EdgeInsets.all(16.0),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         ToggleFlashlightButton(controller: controller),
          //         SwitchCameraButton(controller: controller),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    await controller.dispose();
  }
}

class ScannerOverlay extends CustomPainter {
  const ScannerOverlay({
    required this.scanWindow,
    this.borderRadius = 12.0,
  });

  final Rect scanWindow;
  final double borderRadius;

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: use `Offset.zero & size` instead of Rect.largest
    // we need to pass the size to the custom paint widget
    final backgroundPath = Path()..addRect(Rect.largest);

    final cutoutPath = Path()
      ..addRRect(
        RRect.fromRectAndCorners(
          scanWindow,
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius),
          bottomLeft: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius),
        ),
      );

    final backgroundPaint = Paint()
      ..color = Colors.black.withOpacity(0.5)
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.dstOut;

    final backgroundWithCutout = Path.combine(
      PathOperation.difference,
      backgroundPath,
      cutoutPath,
    );

    final borderPaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    final borderRect = RRect.fromRectAndCorners(
      scanWindow,
      topLeft: Radius.circular(borderRadius),
      topRight: Radius.circular(borderRadius),
      bottomLeft: Radius.circular(borderRadius),
      bottomRight: Radius.circular(borderRadius),
    );

    // First, draw the background,
    // with a cutout area that is a bit larger than the scan window.
    // Finally, draw the scan window itself.
    canvas.drawPath(backgroundWithCutout, backgroundPaint);
    canvas.drawRRect(borderRect, borderPaint);
  }

  @override
  bool shouldRepaint(ScannerOverlay oldDelegate) {
    return scanWindow != oldDelegate.scanWindow ||
        borderRadius != oldDelegate.borderRadius;
  }
}
