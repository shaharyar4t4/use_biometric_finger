import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';

class HomeController extends GetxController {
  void goToDashboard() {
    Get.toNamed(AppRoutes.dashboard);
  }

  void logout() {
    Get.offAllNamed(AppRoutes.login);
  }
}
