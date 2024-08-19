import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:base_flutter/data/app_error.dart';
import 'package:base_flutter/presentation/base/process_status.dart';
import 'package:base_flutter/presentation/components/app_loading.dart';
import 'package:base_flutter/presentation/components/base_button.dart';
import 'package:base_flutter/presentation/components/base_textfield.dart';
import 'package:base_flutter/presentation/pages/register/register_state.dart';
import 'package:base_flutter/presentation/pages/register/register_view_model.dart';
import 'package:base_flutter/presentation/theme/app_them.dart';
import 'package:base_flutter/shared/build_context_ext.dart';
import 'package:base_flutter/shared/utils/input_validator.dart';

class RegisterPage extends ConsumerWidget {
  RegisterPage({super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _hasPressedRegister = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<RegisterState>(registerViewModelProvider, (previous, next) {
      if (next.status.isSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.l10n.registerSuccess),
            onVisible: () => context.navigator.toLogin(),
          ),
        );
        return;
      }
      if (next.status == ProcessStatus.failure && next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text((next.error as AppError).message ?? ''),
          ),
        );
        return;
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
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        context.l10n.commonRegister,
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
                      BaseTextField(
                        controller: _confirmPasswordController,
                        placeholder: context.l10n.commonConfirmPassword,
                        icon: Icons.lock,
                        isSecure: true,
                        validator: (value) =>
                            InputValidator.validateConfirmPassword(
                          _passwordController.text,
                          value,
                        ),
                        onChanged: (_) => _onTextChanged(),
                      ),
                      SizedBox(height: 16.h),
                      BaseButton(
                        title: context.l10n.commonRegister,
                        action: () => _onRegister(context, ref),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        context.l10n.commonAlreadyHaveAccount,
                        textAlign: TextAlign.center,
                        style: context.theme.textTheme.titleSmall,
                      ),
                      SizedBox(height: 16.h),
                      TextButton(
                        onPressed: () => context.navigator.toLogin(),
                        child: Text(
                          context.l10n.commonLogin,
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
            registerViewModelProvider.select(
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
    if (_hasPressedRegister) {
      _formKey.currentState?.validate();
    }
  }

  void _onRegister(BuildContext context, WidgetRef ref) {
    FocusScope.of(context).unfocus();
    _hasPressedRegister = true;
    final isValidInput = _formKey.currentState?.validate() ?? false;
    if (isValidInput) {
      ref
          .read(registerViewModelProvider.notifier)
          .login(_usernameController.text, _passwordController.text);
    }
  }
}
