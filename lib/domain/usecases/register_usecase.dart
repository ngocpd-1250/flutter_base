import 'package:base_flutter/domain/repositories/auth_repository.dart';
import 'package:base_flutter/domain/usecases/base/base_input.dart';
import 'package:base_flutter/domain/usecases/base/usecase.dart';

class RegisterUseCase extends UseCase<RegisterInput, void> {
  final AuthRepository _repository;

  RegisterUseCase(this._repository);

  @override
  Future buildUseCase(RegisterInput input) async {
    return await _repository.register(input.username, input.password);
  }
}

class RegisterInput implements BaseInput {
  final String username;
  final String password;
  RegisterInput({
    required this.username,
    required this.password,
  });
}
