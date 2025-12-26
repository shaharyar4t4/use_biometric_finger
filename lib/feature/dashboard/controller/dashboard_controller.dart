import 'package:get/get.dart';

class DashboardController extends GetxController {
  var username = 'Shaharyar'.obs;

  void logout() {
    Get.offAllNamed('/login');
  }
}
