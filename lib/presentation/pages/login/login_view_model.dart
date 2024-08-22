import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:base_flutter/di/usecase_provider.dart';
import 'package:base_flutter/domain/usecases/login_usecase.dart';
import 'package:base_flutter/presentation/base/process_status.dart';
import 'package:base_flutter/presentation/pages/login/login_state.dart';

part 'login_view_model.g.dart';

@riverpod
class LoginViewModel extends _$LoginViewModel {
  @override
  LoginState build() {
    return LoginState(status: ProcessStatus.initial);
  }

  Future<void> login(String username, String password) async {
    try {
      state = state.copyWith(status: ProcessStatus.loading);
      final input = LoginInput(username: username, password: password);
      await ref.read(loginUseCaseProvider).execute(input);
      state = state.copyWith(status: ProcessStatus.success);
    } catch (e) {
      state = state.copyWith(status: ProcessStatus.failure, error: e);
    }
  }
}
