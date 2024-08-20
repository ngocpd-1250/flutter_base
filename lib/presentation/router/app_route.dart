import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:base_flutter/di/local_provider.dart';
import 'package:base_flutter/presentation/pages/home/home_page.dart';
import 'package:base_flutter/presentation/pages/login/login_page.dart';
import 'package:base_flutter/presentation/pages/onboarding/onboarding_page.dart';
import 'package:base_flutter/presentation/pages/register/register_page.dart';
import 'package:base_flutter/presentation/router/app_routes.dart';

part 'app_route.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  final isOnboardingComplete =
      ref.watch(localDataSourceProvider).getOnboardingStatus();

  final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation:
        isOnboardingComplete ? AppRoutes.login.path : AppRoutes.onboarding.path,
    routes: [
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
      GoRoute(
        name: AppRoutes.home.name,
        path: AppRoutes.home.path,
        pageBuilder: (context, state) => const MaterialPage(
          child: HomePage(),
        ),
      )
    ],
  );

  ref.onDispose(router.dispose);

  return router;
}
