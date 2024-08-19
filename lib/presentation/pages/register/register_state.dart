import 'package:base_flutter/presentation/base/process_status.dart';

class RegisterState {
  ProcessStatus status = ProcessStatus.loading;
  Object? error;

  RegisterState({
    required this.status,
    this.error,
  });

  RegisterState copyWith({
    ProcessStatus? status,
    Object? error,
  }) {
    return RegisterState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
