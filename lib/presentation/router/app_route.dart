import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:base_flutter/di/local_provider.dart';
import 'package:base_flutter/presentation/components/bottom_navigation.dart';
import 'package:base_flutter/presentation/pages/login/login_page.dart';
import 'package:base_flutter/presentation/pages/onboarding/onboarding_page.dart';
import 'package:base_flutter/presentation/pages/register/register_page.dart';
import 'package:base_flutter/presentation/router/app_routes.dart';
import 'package:base_flutter/presentation/router/stack/movie_stack.dart';
import 'package:base_flutter/presentation/router/stack/settings_stack.dart';
import 'package:base_flutter/presentation/router/stack/todo_stack.dart';

part 'app_route.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  final isOnboardingComplete =
      ref.read(localDataSourceProvider).getOnboardingStatus();

  final isLoggedIn = ref.read(localDataSourceProvider).getAuthTokens() != null;

  final authRoutes = <GoRoute>[
    GoRoute(
      name: AppRoutes.onboarding.name,
      path: AppRoutes.onboarding.path,
      pageBuilder: (context, state) => MaterialPage(
        child: OnboardingPage(),
      ),
    ),
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
    ),
  ];

  final homeRoute = StatefulShellRoute.indexedStack(
    builder: (BuildContext context, GoRouterState state, Widget child) {
      return BottomNavigation(child: child);
    },
    branches: <StatefulShellBranch>[
      movieStack,
      todoStack,
      settingsStack,
    ],
  );

  final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: isOnboardingComplete
        ? (isLoggedIn ? AppRoutes.topMovie.path : AppRoutes.login.path)
        : AppRoutes.onboarding.path,
    routes: [
      homeRoute,
      ...authRoutes,
    ],
  );

  ref.onDispose(router.dispose);

  return router;
}
