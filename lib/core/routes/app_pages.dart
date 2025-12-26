import 'package:get/get.dart';
import 'package:use_biometric_finger/core/routes/app_routes.dart';
import 'package:use_biometric_finger/feature/dashboard/view/view_dashbored.dart';
import 'package:use_biometric_finger/feature/home/view/home_view.dart';
import 'package:use_biometric_finger/feature/login/view/login_view.dart';
import 'package:use_biometric_finger/feature/splash/view/splash_view.dart';


class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashView(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginView(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => DashboardView(),
    ),
  ];
}
  