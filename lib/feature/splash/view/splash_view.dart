import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:use_biometric_finger/feature/splash/controller/splash_controller.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
