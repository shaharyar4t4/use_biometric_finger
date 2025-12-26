import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class BiometricService {
  final LocalAuthentication _auth = LocalAuthentication();

  Future<bool> isDeviceSupported() async {
    try {
      return await _auth.isDeviceSupported();
    } catch (_) {
      return false;
    }
  }

  Future<bool> canCheckBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } catch (_) {
      return false;
    }
  }

  Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } catch (_) {
      return <BiometricType>[];
    }
  }

Future<bool> authenticate() async {
  try {
    return await _auth.authenticate(
      localizedReason: 'Confirm your identity',
      biometricOnly: false, // 🔑 VERY IMPORTANT
      persistAcrossBackgrounding: true,
    );
  } catch (e) {
    print('Auth error: $e');
    return false;
  }
}


  Future<void> cancelAuthentication() async {
    await _auth.stopAuthentication();
  }
}
