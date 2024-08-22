import 'package:base_flutter/domain/repositories/app_repository.dart';
import 'package:base_flutter/domain/usecases/base/base_input.dart';
import 'package:base_flutter/domain/usecases/base/usecase.dart';

class SetJapaneseLanguageUseCase
    extends UseCase<SetJapaneseLanguageInput, void> {
  final AppRepository _repository;

  SetJapaneseLanguageUseCase(this._repository);

  @override
  Future buildUseCase(SetJapaneseLanguageInput input) async {
    return _repository.setDarkModeStatus(input.isJapaneseLanguage);
  }
}

class SetJapaneseLanguageInput implements BaseInput {
  final bool isJapaneseLanguage;

  SetJapaneseLanguageInput({
    required this.isJapaneseLanguage,
  });
}
