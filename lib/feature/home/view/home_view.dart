import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:use_biometric_finger/feature/home/view/drawer_view.dart';
import '../controller/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const DrawerView(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.home, size: 80),
            const SizedBox(height: 20),
            const Text(
              'Home Screen',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: controller.goToDashboard,
              child: const Text('Go to Dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}
