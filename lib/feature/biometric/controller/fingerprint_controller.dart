import 'package:get/get.dart';
import '../../../core/services/biometric_service.dart';
import '../../../core/services/storage_service.dart';

class FingerprintController extends GetxController {
  final BiometricService biometricService = BiometricService();
  final StorageService storageService = StorageService();

  var isEnabled = false.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadStatus();
  }

  Future<void> loadStatus() async {
    isEnabled.value = await storageService.isBiometricEnabled();
  }

  Future<void> enableBiometric() async {
    if (isEnabled.value) return;

    isLoading.value = true;

    final isSupported = await biometricService.isDeviceSupported();
    final canCheck = await biometricService.canCheckBiometrics();

    if (!isSupported || !canCheck) {
      isLoading.value = false;
      Get.snackbar(
        'Error',
        'Biometric not supported or not enrolled',
      );
      return;
    }

    await Future.delayed(const Duration(milliseconds: 400));

    final success = await biometricService.authenticate();
    isLoading.value = false;

    if (success) {
      await storageService.setBiometric(true);
      isEnabled.value = true;

      Get.snackbar(
        'Success',
        'Fingerprint enabled successfully',
      );
    }
  }

  Future<void> disableBiometric() async {
    await storageService.setBiometric(false);
    isEnabled.value = false;

    Get.snackbar(
      'Disabled',
      'Fingerprint login disabled',
    );
  }
}
