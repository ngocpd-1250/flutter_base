import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:base_flutter/presentation/router/app_routes.dart';
import 'package:base_flutter/presentation/theme/app_them.dart';
import 'package:base_flutter/shared/extensions/build_context_ext.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: context.theme.appColors.backgroundPrimary,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.movie),
            label: context.l10n.bottomBarMovie,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.task),
            label: context.l10n.bottomBarTodo,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: context.l10n.bottomBarSettings,
          ),
        ],
        currentIndex: _getSelectedIndex(context),
        selectedFontSize: context.theme.textTheme.labelMedium?.fontSize ?? 10,
        unselectedFontSize: context.theme.textTheme.labelMedium?.fontSize ?? 10,
        selectedItemColor: context.theme.appColors.primary,
        onTap: (int index) => _onItemTapped(index, context),
      ),
    );
  }

  static int _getSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith(AppRoutes.topMovie.path)) {
      return 0;
    }
    if (location.startsWith(AppRoutes.todo.path)) {
      return 1;
    }
    if (location.startsWith(AppRoutes.settings.path)) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go(AppRoutes.topMovie.path);
        break;
      case 1:
        GoRouter.of(context).go(AppRoutes.todo.path);
        break;
      case 2:
        GoRouter.of(context).go(AppRoutes.settings.path);
        break;
    }
  }
}
