import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:base_flutter/presentation/pages/top_movie/top_movie_page.dart';
import 'package:base_flutter/presentation/router/app_routes.dart';

final movieStack = StatefulShellBranch(
  routes: <RouteBase>[
    GoRoute(
      name: AppRoutes.topMovie.name,
      path: AppRoutes.topMovie.path,
      builder: (BuildContext context, GoRouterState state) {
        return const TopMoviePage();
      },
      routes: const [],
    ),
  ],
);
