import 'package:authtest/arguments.dart';
import 'package:authtest/auth/auth_screen.dart';
import 'package:authtest/auth/confirm_code_screen.dart';
import 'package:authtest/routing_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class AppRouter {
  static Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AuthRoute:
        return MaterialPageRoute(builder: (context) => AuthScreen());
      case ConfirmCodeRoute:
        final AuthArgs args = routeSettings.arguments as AuthArgs;
        return MaterialPageRoute(builder: (context) => ConfirmPhoneScreen(authArgs: args));
      default:
        return MaterialPageRoute(builder: (context) => AuthScreen());
    }
  }
}