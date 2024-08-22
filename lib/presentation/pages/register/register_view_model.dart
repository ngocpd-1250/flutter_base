import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:base_flutter/di/usecase_provider.dart';
import 'package:base_flutter/domain/usecases/register_usecase.dart';
import 'package:base_flutter/presentation/base/process_status.dart';
import 'package:base_flutter/presentation/pages/register/register_state.dart';

part 'register_view_model.g.dart';

@riverpod
class RegisterViewModel extends _$RegisterViewModel {
  @override
  RegisterState build() {
    return RegisterState(status: ProcessStatus.initial);
  }

  Future<void> login(String username, String password) async {
    try {
      state = state.copyWith(status: ProcessStatus.loading);
      final input = RegisterInput(username: username, password: password);
      await ref.read(registerUseCaseProvider).execute(input);
      state = state.copyWith(status: ProcessStatus.success);
    } catch (e) {
      state = state.copyWith(status: ProcessStatus.failure, error: e);
    }
  }
}
