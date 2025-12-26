import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../biometric/view/fingerprint_view.dart';
import '../controller/home_controller.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.person, size: 60, color: Colors.white),
                SizedBox(height: 10),
                Text(
                  'Welcome User',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),

          /// 🔐 Fingerprint Toggle
ListTile(
  leading: const Icon(Icons.fingerprint),
  title: const Text('Fingerprint Login'),
  onTap: () {
    Get.back(); // 🔑 Close drawer first
    Get.to(() => FingerprintView());
  },
),


          const Divider(),

          /// 🚪 Logout
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: controller.logout,
          ),
        ],
      ),
    );
  }
}
