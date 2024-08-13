import 'package:flutter/material.dart';
import 'package:flutter_localization_multi_language/screen/about_screen.dart';
import 'package:flutter_localization_multi_language/screen/home_screen.dart';
import 'package:flutter_localization_multi_language/screen/not_found_page.dart';
import 'package:flutter_localization_multi_language/screen/setting_screen.dart';
import 'package:flutter_localization_multi_language/services/router/route_constants.dart';

class CustomRouter {

  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.homeScreen :
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case RouteConstants.aboutScreen :
        return MaterialPageRoute(builder: (context) => const AboutScreen());

      case RouteConstants.settingScreen :
        return MaterialPageRoute(builder: (context) => const SettingScreen());

      default :
        return MaterialPageRoute(builder: (context) => const NotFoundScreen());
    }
  }

}