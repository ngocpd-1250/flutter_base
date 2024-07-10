import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:base_flutter/presentation/pages/login/login_page.dart';
import 'package:base_flutter/presentation/pages/register/register_page.dart';
import 'package:base_flutter/presentation/router/app_routes.dart';

class AppRoute {
  static final router = GoRouter(
    initialLocation: AppRoutes.login.path,
    routes: [
      GoRoute(
        name: AppRoutes.login.name,
        path: AppRoutes.login.path,
        pageBuilder: (context, state) => MaterialPage(
          child: LoginPage(),
        ),
      ),
      GoRoute(
        name: AppRoutes.register.name,
        path: AppRoutes.register.path,
        pageBuilder: (context, state) => MaterialPage(
          child: RegisterPage(),
        ),
      )
    ],
  );
}
