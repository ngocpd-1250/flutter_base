import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:base_flutter/presentation/router/app_route.dart';
import 'package:base_flutter/presentation/theme/app_them.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return ChangeNotifierProvider(
          create: (_) => AppTheme(),
          builder: (context, _) => MaterialApp.router(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: context.watch<AppTheme>().themeMode,
            routerConfig: AppRoute.router,
          ),
        );
      },
    );
  }
}
