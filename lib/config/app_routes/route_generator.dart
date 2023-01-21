import 'package:flutter/material.dart';
import 'package:makan_employee/config/app_routes/app_routes.dart';
import 'package:makan_employee/features/auth_module/login_screen.dart';
import 'package:makan_employee/features/game_selection_module/game_selection_screen.dart';
import 'package:makan_employee/features/main_services_module/main_services_screen.dart';
import 'package:makan_employee/features/scanning_module/makan_scan_screen.dart';
import 'package:makan_employee/features/scanning_module/scan_result_screen.dart';
import 'package:makan_employee/features/scanning_module/start_scan_screen.dart';
import 'package:makan_employee/features/welcome_module/select_language_screen.dart';
import 'package:makan_employee/features/welcome_module/splash_screen.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case Routes.gameCategorySelection:
        return MaterialPageRoute(
            builder: (context) => const GameSelectionScreen());

      case Routes.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case Routes.mainServices:
        return MaterialPageRoute(
            builder: (context) => const MainServicesScreen());

      case Routes.selectLanguage:
        return MaterialPageRoute(
            builder: (context) => const SelectLanguageScreen());

      case Routes.scan:
        return MaterialPageRoute(builder: (context) => const ScanningScreen());
      case Routes.startScan:
        return MaterialPageRoute(
            builder: (context) => StartScanScreen(
                  scanData: settings.arguments,
                ));
      case Routes.scanResultScreen:
        return MaterialPageRoute(
            builder: (context) =>  ScanResultScreen(dataModel:settings.arguments ,));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) => Scaffold(body: Container()));
  }
}
