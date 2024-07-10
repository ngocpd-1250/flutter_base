import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:base_flutter/presentation/router/app_route.dart';
import 'package:base_flutter/presentation/theme/app_them.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppTheme(),
      builder: (context, _) => MaterialApp.router(
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: context.watch<AppTheme>().themeMode,
        routerConfig: AppRoute.router,
      ),
    );
  }
}
