import 'package:eco_challenge/constants/app_text_styles.dart';
import 'package:eco_challenge/ui/pages/qr_code_scanner/scan_qrcode_controller.dart';
import 'package:eco_challenge/ui/widgets/base_button.dart';
import 'package:eco_challenge/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';

class ScanQRCodeScreen extends StatelessWidget {
  ScanQRCodeScreen({Key? key}) : super(key: key);

  final QRCodeController qrController =
      Get.put(QRCodeController()); // Initialize controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan Event Code"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          QRCodeDartScanView(
            scanInvertedQRCode: true,
            // enable scan invert qr code ( default = false)

            typeScan: TypeScan.live,
            // if TypeScan.takePicture will try decode when click to take a picture(default TypeScan.live)

            onCapture: (Result result) {
              // do anything with result
              // result.text
              // result.rawBytes
              // result.resultPoints
              // result.format
              // result.numBits
              // result.resultMetadata
              // result.time
            },
          ).paddingHorizontal36(),
          Obx(() {
            // Listen to changes in scannedResult
            return Text(
                'Scanned Event Details: ${qrController.scannedResult.value}',
                style: AppTextStyles.textStyleBlack14With400);
          }).paddingAll16(),
          BaseButton(
            text: 'Submit',
            isWrapWidth: true,
            onSubmit: () async {
              Get.back(result: true);
            },
          )
        ],
      ),
    );
  }
}
