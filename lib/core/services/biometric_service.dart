import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class BiometricService {
  final LocalAuthentication _auth = LocalAuthentication();

  /// ✅ Check device support
  Future<bool> isDeviceSupported() async {
    try {
      return await _auth.isDeviceSupported();
    } catch (_) {
      return false;
    }
  }

  /// ✅ Check biometric availability
  Future<bool> canCheckBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } catch (_) {
      return false;
    }
  }

  /// ✅ Get available biometrics (fingerprint / face)
  Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } catch (_) {
      return <BiometricType>[];
    }
  }

  /// 🔐 Authenticate with biometrics only (NEW API)
  Future<bool> authenticate() async {
    try {
      return await _auth.authenticate(
        localizedReason: 'Scan your fingerprint to continue',
        biometricOnly: true,
        persistAcrossBackgrounding: true,
      );
    } on LocalAuthException catch (e) {
      print('LocalAuth Error: ${e.code}');
      return false;
    } on PlatformException catch (e) {
      print('Platform Error: ${e.message}');
      return false;
    }
  }

  /// ❌ Cancel authentication (optional)
  Future<void> cancelAuthentication() async {
    await _auth.stopAuthentication();
  }
}
