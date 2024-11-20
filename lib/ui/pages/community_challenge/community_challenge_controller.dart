import 'package:confetti/confetti.dart';
import 'package:get/get.dart';

class CommunityChallengeController extends GetxController {
  // Reactive variable to store the scanned result
  var scannedResult = false.obs;
  late ConfettiController confettiController;

  updateScannedResult(bool result) {
    scannedResult.value = true;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    confettiController = ConfettiController(
        duration: const Duration(seconds: 3)); // Initialize confetti controller
  }

  @override
  void dispose() {
    confettiController
        .dispose(); // Dispose confetti controller when screen is disposed
    super.dispose();
  }
}
