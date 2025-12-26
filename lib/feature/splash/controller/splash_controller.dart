import 'package:get/get.dart';
import 'package:use_biometric_finger/core/routes/app_routes.dart';
import 'package:use_biometric_finger/core/services/biometric_service.dart';
import 'package:use_biometric_finger/core/services/storage_service.dart';

class SplashController extends GetxController {
  final biometricService = BiometricService();
  final storageService = StorageService();

  @override
  void onInit() {
    _checkFlow();
    super.onInit();
  }

  Future<void> _checkFlow() async {
    await Future.delayed(const Duration(seconds: 2));

    final enabled = await storageService.isBiometricEnabled();

    if (!enabled) {
      Get.offAllNamed(AppRoutes.login);
      return;
    }

    final isSupported = await biometricService.isDeviceSupported();
    final canCheck = await biometricService.canCheckBiometrics();

    if (!isSupported || !canCheck) {
      Get.offAllNamed(AppRoutes.login);
      return;
    }

    await Future.delayed(const Duration(milliseconds: 300));

    final success = await biometricService.authenticate();
    if (success) {
      Get.offAllNamed(AppRoutes.dashboard);
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }
}
