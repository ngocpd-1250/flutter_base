import 'package:base_flutter/domain/repositories/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository _repository;

  LogoutUseCase(this._repository);

  void execute() {
    _repository.logout();
  }
}
