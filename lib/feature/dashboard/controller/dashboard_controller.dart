import 'package:get/get.dart';

class DashboardController extends GetxController {
  var username = 'Shaharyar'.obs;

  void logout() {
    // future me clear session / token
    Get.offAllNamed('/login');
  }
}
