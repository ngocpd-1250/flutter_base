import 'package:flutter/material.dart';

import 'package:base_flutter/presentation/theme/app_them.dart';

class BaseTextField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final IconData icon;
  final bool isSecure;
  final String errorMessage;

  const BaseTextField({
    super.key,
    required this.controller,
    required this.placeholder,
    required this.icon,
    this.isSecure = false,
    this.errorMessage = '',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: Colors.grey,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: isSecure
                    ? TextField(
                        controller: controller,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: placeholder,
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: context.theme.appColors.labelPrimary
                                .withAlpha(120),
                            fontSize: 14.0,
                          ),
                        ),
                        style: TextStyle(
                          color: context.theme.appColors.labelPrimary,
                        ),
                      )
                    : TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          hintText: placeholder,
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: context.theme.appColors.labelPrimary
                                .withAlpha(120),
                            fontSize: 14.0,
                          ),
                        ),
                        style: TextStyle(
                          color: context.theme.appColors.labelPrimary,
                        ),
                      ),
              ),
            ),
          ],
        ),
        Container(
          height: 1,
          color: Colors.grey,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
        ),
        if (errorMessage.isNotEmpty)
          AnimatedOpacity(
            opacity: errorMessage.isNotEmpty ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: Text(
              errorMessage,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}
