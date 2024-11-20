import 'package:get/get.dart';

class QRCodeController extends GetxController {
  // Reactive variable to store the scanned result
  var scannedResult = "-".obs;

  // Method to update the scanned result
  void updateScannedResult(String result) {
    scannedResult.value = result;
  }
}
