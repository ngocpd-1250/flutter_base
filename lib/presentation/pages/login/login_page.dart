import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:base_flutter/presentation/base/process_status.dart';
import 'package:base_flutter/presentation/components/app_loading.dart';
import 'package:base_flutter/presentation/components/base_button.dart';
import 'package:base_flutter/presentation/components/base_textfield.dart';
import 'package:base_flutter/presentation/pages/login/login_state.dart';
import 'package:base_flutter/presentation/pages/login/login_view_model.dart';
import 'package:base_flutter/presentation/router/app_navigator.dart';
import 'package:base_flutter/presentation/theme/app_them.dart';
import 'package:base_flutter/shared/build_context_ext.dart';
import 'package:base_flutter/shared/utils/input_validator.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({
    super.key,
  });

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _hasPressedLogin = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<LoginState>(loginViewModelProvider, (_, next) {
      if (next.status.isSuccess) {
        context.navigator.toRegister();
      }
    });
    return Scaffold(
      backgroundColor: context.theme.appColors.backgroundPrimary,
      body: Stack(
        children: [
          Center(
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
                        controller: _usernameController,
                        placeholder: context.l10n.commonUsername,
                        icon: Icons.email,
                        validator: (value) =>
                            InputValidator.validateEmail(value),
                        onChanged: (_) => _onTextChanged(),
                      ),
                      SizedBox(height: 16.h),
                      BaseTextField(
                        controller: _passwordController,
                        placeholder: context.l10n.commonPassword,
                        icon: Icons.lock,
                        isSecure: true,
                        validator: (value) =>
                            InputValidator.validatePassword(value),
                        onChanged: (_) => _onTextChanged(),
                      ),
                      SizedBox(height: 16.h),
                      BaseButton(
                        title: context.l10n.commonLogin,
                        action: () => _onLogin(context, ref),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        context.l10n.commonDontHaveAccount,
                        textAlign: TextAlign.center,
                        style: context.theme.textTheme.titleSmall,
                      ),
                      SizedBox(height: 16.h),
                      TextButton(
                        onPressed: () => context.navigator.toRegister(),
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
          ref.watch(
            loginViewModelProvider.select(
              (selector) {
                return selector.status.isLoading
                    ? const AppLoading()
                    : const SizedBox.shrink();
              },
            ),
          )
        ],
      ),
    );
  }

  void _onTextChanged() {
    if (_hasPressedLogin) {
      _formKey.currentState?.validate();
    }
  }

  void _onLogin(BuildContext context, WidgetRef ref) {
    FocusScope.of(context).unfocus();
    _hasPressedLogin = true;
    if (_formKey.currentState?.validate() ?? false) {
      ref
          .read(loginViewModelProvider.notifier)
          .login(_usernameController.text, _passwordController.text);
    }
  }
}
