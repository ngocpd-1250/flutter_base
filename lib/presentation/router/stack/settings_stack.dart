import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:base_flutter/presentation/pages/settings/settings_page.dart';
import 'package:base_flutter/presentation/router/app_routes.dart';

final settingsStack = StatefulShellBranch(
  routes: <RouteBase>[
    GoRoute(
      name: AppRoutes.settings.name,
      path: AppRoutes.settings.path,
      builder: (BuildContext context, GoRouterState state) {
        return const SettingsPage();
      },
      routes: const [],
    ),
  ],
);
