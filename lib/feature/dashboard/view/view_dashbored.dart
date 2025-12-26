import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:use_biometric_finger/feature/dashboard/controller/dashboard_controller.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});

  final controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: controller.logout,
          )
        ],
      ),
      body: Center(
        child: Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.dashboard, size: 80),
                const SizedBox(height: 20),
                Text(
                  'Welcome ${controller.username.value}',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Biometric verified successfully ✅',
                  style: TextStyle(color: Colors.green),
                ),
              ],
            )),
      ),
    );
  }
}
