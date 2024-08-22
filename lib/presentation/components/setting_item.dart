import 'package:flutter/material.dart';

import 'package:base_flutter/presentation/theme/app_them.dart';
import 'package:base_flutter/shared/extensions/build_context_ext.dart';

class SettingItem extends StatelessWidget {
  final String title;
  final bool? value;
  final VoidCallback action;

  const SettingItem({
    super.key,
    required this.title,
    this.value,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: InkWell(
        onTap: value != null ? null : action,
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: context.theme.appColors.labelPrimary,
              ),
            ),
            const Spacer(),
            if (value != null)
              Switch(
                value: value!,
                onChanged: (bool newValue) => action(),
                activeColor: context.theme.appColors.primary,
              )
            else
              const Flexible(
                child: Row(
                  children: [
                    Spacer(),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
