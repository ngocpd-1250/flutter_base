import 'package:base_flutter/domain/repositories/app_repository.dart';

class GetJapaneseLanguageUseCase {
  final AppRepository _repository;

  GetJapaneseLanguageUseCase(this._repository);

  bool execute() {
    return _repository.getJapaneseLanguageStatus();
  }
}
