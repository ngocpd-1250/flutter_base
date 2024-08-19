import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'app_routes.dart';

abstract class AppNavigator {
  void toLogin();
  void toRegister();
  void toHome();
}

class AppNavigatorImpl implements AppNavigator {
  AppNavigatorImpl(this.context);

  final BuildContext context;

  @override
  void toLogin() {
    context.pushReplacementNamed(AppRoutes.login.name);
  }

  @override
  void toRegister() {
    context.pushReplacementNamed(AppRoutes.register.name);
  }

  @override
  void toHome() {
    context.replaceNamed(AppRoutes.home.name);
  }
}
