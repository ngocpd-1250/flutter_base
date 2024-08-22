import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:base_flutter/presentation/components/setting_item.dart';
import 'package:base_flutter/presentation/pages/settings/settings_view_model.dart';
import 'package:base_flutter/shared/extensions/build_context_ext.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(settingsViewModelProvider);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SettingItem(
                  title: context.l10n.settingsDarkMode,
                  value: viewModel.isDarkMode,
                  action: () => {
                    ref
                        .read(settingsViewModelProvider.notifier)
                        .setDarkMode(!viewModel.isDarkMode)
                  },
                ),
                const SizedBox(height: 16.0),
                SettingItem(
                  title: context.l10n.settingsJapaneseLanguage,
                  value: viewModel.isJapanese,
                  action: () => {
                    ref
                        .read(settingsViewModelProvider.notifier)
                        .setJapaneseLanguage(!viewModel.isJapanese)
                  },
                ),
                const SizedBox(height: 16.0),
                SettingItem(
                  title: context.l10n.settingsLogout,
                  action: () => {
                    ref.read(settingsViewModelProvider.notifier).logout(),
                    context.navigator.toLogin(),
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
