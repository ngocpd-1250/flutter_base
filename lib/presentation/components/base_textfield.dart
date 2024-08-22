import 'package:flutter/material.dart';

import 'package:base_flutter/presentation/theme/app_them.dart';
import 'package:base_flutter/shared/extensions/build_context_ext.dart';

class InputOptions {
  InputOptions({
    this.maxLength,
    this.cursorColor,
    this.maxLines,
    this.keyboardType,
    this.width,
    this.padding,
    this.expands,
    this.enabled,
    this.obscuringCharacter = '●',
    this.textInputAction = TextInputAction.done,
  });

  final int? maxLength;
  final Color? cursorColor;
  final int? maxLines;
  final TextInputType? keyboardType;
  final double? width;
  final EdgeInsets? padding;
  final bool? expands;
  final bool? enabled;
  final String? obscuringCharacter;
  final TextInputAction? textInputAction;
}

class BaseTextField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final IconData icon;
  final bool isSecure;
  final InputOptions? inputOptions;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  const BaseTextField({
    super.key,
    required this.controller,
    required this.placeholder,
    required this.icon,
    this.isSecure = false,
    this.inputOptions,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: inputOptions?.padding ?? const EdgeInsets.all(0),
                child: TextFormField(
                  controller: controller,
                  obscureText: isSecure,
                  validator: validator,
                  maxLength: inputOptions?.maxLength,
                  cursorColor: inputOptions?.cursorColor,
                  cursorErrorColor: context.theme.appColors.primary,
                  maxLines: inputOptions?.maxLines ?? 1,
                  keyboardType: inputOptions?.keyboardType,
                  expands: inputOptions?.expands ?? false,
                  enabled: inputOptions?.enabled ?? true,
                  obscuringCharacter: inputOptions?.obscuringCharacter ?? '•',
                  textInputAction:
                      inputOptions?.textInputAction ?? TextInputAction.done,
                  onChanged: onChanged,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(
                        icon,
                        color: Colors.grey,
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 10,
                      minHeight: 10,
                    ),
                    hintText: placeholder,
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(width: 0.5),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.8,
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.8,
                        color: context.theme.appColors.primary,
                      ),
                    ),
                    errorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.8,
                        color: Colors.grey,
                      ),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.8,
                        color: context.theme.appColors.primary,
                      ),
                    ),
                    hintStyle: TextStyle(
                      color: context.theme.textTheme.bodySmall?.color
                          ?.withAlpha(120),
                      fontSize: 14.0,
                    ),
                    errorStyle: const TextStyle(
                      color: Colors.red,
                    ),
                    counterText: '',
                  ),
                  style: TextStyle(
                    color: context.theme.textTheme.bodySmall?.color,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
