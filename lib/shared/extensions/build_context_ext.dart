import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:base_flutter/presentation/router/app_navigator.dart';

extension BuildContextExt on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}

extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
}

extension NavigationHelpersExt on BuildContext {
  AppNavigator get navigator => AppNavigatorImpl(this);
}
