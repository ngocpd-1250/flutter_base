import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:base_flutter/presentation/components/base_button.dart';
import 'package:base_flutter/presentation/components/base_textfield.dart';
import 'package:base_flutter/presentation/router/app_navigator.dart';
import 'package:base_flutter/presentation/theme/app_them.dart';
import 'package:base_flutter/shared/utils/input_validator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final bool isEnable = true;
  bool hasPressedRegister = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.appColors.backgroundPrimary,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Register',
                    style: context.theme.textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                  BaseTextField(
                    controller: usernameController,
                    placeholder: 'username',
                    icon: Icons.email,
                    validator: (value) => InputValidator.validateEmail(value),
                    onChanged: (_) => {
                      if (hasPressedRegister)
                        {_formKey.currentState!.validate()}
                    },
                  ),
                  SizedBox(height: 16.h),
                  BaseTextField(
                    controller: passwordController,
                    placeholder: 'password',
                    icon: Icons.lock,
                    isSecure: true,
                    validator: (value) =>
                        InputValidator.validatePassword(value),
                    onChanged: (_) => {
                      if (hasPressedRegister)
                        {_formKey.currentState!.validate()}
                    },
                  ),
                  SizedBox(height: 16.h),
                  BaseTextField(
                    controller: confirmPasswordController,
                    placeholder: 'confirm password',
                    icon: Icons.lock,
                    isSecure: true,
                    validator: (value) =>
                        InputValidator.validateConfirmPassword(
                      passwordController.text,
                      value,
                    ),
                    onChanged: (_) => {
                      if (hasPressedRegister)
                        {_formKey.currentState!.validate()}
                    },
                  ),
                  SizedBox(height: 16.h),
                  BaseButton(
                    title: 'Register',
                    isEnabled: isEnable,
                    action: () => {
                      hasPressedRegister = true,
                      _formKey.currentState!.validate()
                    },
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "Don't have an account?",
                    textAlign: TextAlign.center,
                    style: context.theme.textTheme.titleSmall,
                  ),
                  SizedBox(height: 16.h),
                  TextButton(
                    onPressed: () => context.navigator.toLogin(),
                    child: Text(
                      'Login',
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
