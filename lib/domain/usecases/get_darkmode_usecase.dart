import 'package:base_flutter/domain/repositories/app_repository.dart';

class GetDarkModeUseCase {
  final AppRepository _repository;

  GetDarkModeUseCase(this._repository);

  bool execute() {
    return _repository.getDarkModeStatus();
  }
}
