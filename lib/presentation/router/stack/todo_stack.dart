import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:base_flutter/presentation/pages/todo/todo_page.dart';
import 'package:base_flutter/presentation/router/app_routes.dart';

final todoStack = StatefulShellBranch(
  routes: <RouteBase>[
    GoRoute(
      name: AppRoutes.todo.name,
      path: AppRoutes.todo.path,
      builder: (BuildContext context, GoRouterState state) {
        return const TodoPage();
      },
      routes: const [],
    ),
  ],
);
