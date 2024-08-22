import 'package:flutter/material.dart';

import 'package:base_flutter/presentation/theme/app_them.dart';
import 'package:base_flutter/shared/extensions/build_context_ext.dart';

class BaseButton extends StatelessWidget {
  final String title;
  final bool isEnabled;
  final VoidCallback action;

  const BaseButton({
    super.key,
    required this.title,
    required this.action,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? action : null,
      style: ButtonStyle(
        backgroundColor:
            WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return context.theme.appColors.primary.withOpacity(0.5);
          }
          return context.theme.appColors.primary;
        }),
        foregroundColor:
            WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return Colors.white.withOpacity(0.5);
          }
          return Colors.white;
        }),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        minimumSize:
            WidgetStateProperty.all<Size>(const Size(double.infinity, 50)),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isEnabled ? Colors.white : Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }
}
