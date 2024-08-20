import 'package:base_flutter/domain/repositories/app_repository.dart';
import 'package:base_flutter/domain/usecases/base/base_input.dart';

class CompleteOnboardingUseCase {
  final AppRepository _repository;

  CompleteOnboardingUseCase(this._repository);

  void setOnboardingComplete() {
    _repository.setOnboardingComplete();
  }
}

class OnboardingInput implements BaseInput {}
