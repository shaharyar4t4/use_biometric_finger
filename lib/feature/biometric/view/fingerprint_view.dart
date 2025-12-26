import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/fingerprint_controller.dart';

class FingerprintView extends StatelessWidget {
  FingerprintView({super.key});

  final FingerprintController controller =
      Get.put(FingerprintController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fingerprint Login'),
      ),
      body: Center(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const CircularProgressIndicator();
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.fingerprint,
                size: 100,
                color: controller.isEnabled.value
                    ? Colors.green
                    : Colors.grey,
              ),
              const SizedBox(height: 20),
              Text(
                controller.isEnabled.value
                    ? 'Fingerprint is Enabled'
                    : 'Fingerprint is Disabled',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: controller.isEnabled.value
                    ? controller.disableBiometric
                    : controller.enableBiometric,
                child: Text(
                  controller.isEnabled.value
                      ? 'Disable Fingerprint'
                      : 'Enable Fingerprint',
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
