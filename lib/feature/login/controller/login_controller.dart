import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/routes/app_routes.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;

  void login() async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Email & Password required');
      return;
    }

    isLoading.value = true;

    // ⏳ Fake API Delay
    await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;

    // ✅ Login success
    Get.offAllNamed(AppRoutes.home);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
