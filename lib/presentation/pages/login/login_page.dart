import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:base_flutter/presentation/components/base_button.dart';
import 'package:base_flutter/presentation/components/base_textfield.dart';
import 'package:base_flutter/presentation/router/app_navigator.dart';
import 'package:base_flutter/presentation/theme/app_them.dart';
import 'package:base_flutter/shared/build_context_ext.dart';
import 'package:base_flutter/shared/utils/input_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _hasPressedLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.appColors.backgroundPrimary,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    context.l10n.commonLogin,
                    style: context.theme.textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                  BaseTextField(
                    controller: usernameController,
                    placeholder: context.l10n.commonUsername,
                    icon: Icons.email,
                    validator: (value) => InputValidator.validateEmail(value),
                    onChanged: (_) => {
                      if (_hasPressedLogin) {_formKey.currentState?.validate()}
                    },
                  ),
                  SizedBox(height: 16.h),
                  BaseTextField(
                    controller: passwordController,
                    placeholder: context.l10n.commonPassword,
                    icon: Icons.lock,
                    isSecure: true,
                    validator: (value) =>
                        InputValidator.validatePassword(value),
                    onChanged: (_) => {
                      if (_hasPressedLogin) {_formKey.currentState?.validate()}
                    },
                  ),
                  SizedBox(height: 16.h),
                  BaseButton(
                    title: context.l10n.commonLogin,
                    action: () {
                      _hasPressedLogin = true;
                      _formKey.currentState?.validate();
                    },
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    context.l10n.commonDontHaveAccount,
                    textAlign: TextAlign.center,
                    style: context.theme.textTheme.titleSmall,
                  ),
                  SizedBox(height: 16.h),
                  TextButton(
                    onPressed: () => context.navigator.toTopMovie(),
                    child: Text(
                      context.l10n.commonRegister,
                      style: context.theme.textTheme.titleSmall,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
