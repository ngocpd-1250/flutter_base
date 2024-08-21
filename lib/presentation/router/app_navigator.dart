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
    context.pushReplacement(AppRoutes.login.path);
  }

  @override
  void toHome() {
    context.replace(AppRoutes.topMovie.path);
  }

  @override
  void toRegister() {
    context.pushReplacement(AppRoutes.register.path);
  }
}
