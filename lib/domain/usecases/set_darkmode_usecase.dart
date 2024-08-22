import 'package:base_flutter/domain/repositories/app_repository.dart';
import 'package:base_flutter/domain/usecases/base/base_input.dart';
import 'package:base_flutter/domain/usecases/base/usecase.dart';

class SetDarkModeUseCase extends UseCase<SetDarkModeInput, void> {
  final AppRepository _repository;

  SetDarkModeUseCase(this._repository);

  @override
  Future buildUseCase(SetDarkModeInput input) async {
    return _repository.setDarkModeStatus(input.isDarkMode);
  }
}

class SetDarkModeInput implements BaseInput {
  final bool isDarkMode;

  SetDarkModeInput({
    required this.isDarkMode,
  });
}
