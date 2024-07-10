import 'package:flutter/material.dart';

import 'package:base_flutter/presentation/components/base_button.dart';
import 'package:base_flutter/presentation/components/base_textfield.dart';
import 'package:base_flutter/presentation/router/app_navigator.dart';
import 'package:base_flutter/presentation/theme/app_them.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final bool isEnable = true;
  final String usernameValidationMessage = '';
  final String passwordValidationMessage = '';

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.appColors.backgroundPrimary,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Login',
                  style: context.theme.textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                BaseTextField(
                  controller: usernameController,
                  placeholder: 'username',
                  icon: Icons.email,
                  errorMessage: usernameValidationMessage,
                ),
                const SizedBox(height: 16),
                BaseTextField(
                  controller: passwordController,
                  placeholder: 'password',
                  icon: Icons.lock,
                  isSecure: true,
                  errorMessage: passwordValidationMessage,
                ),
                const SizedBox(height: 16),
                BaseButton(
                  title: 'Login',
                  isEnabled: isEnable,
                  action: () => {},
                ),
                const SizedBox(height: 16),
                Text(
                  "Don't have an account?",
                  textAlign: TextAlign.center,
                  style: context.theme.textTheme.titleSmall,
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () => context.navigator.toRegister(),
                  child: Text(
                    'Register',
                    style: context.theme.textTheme.titleSmall,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
