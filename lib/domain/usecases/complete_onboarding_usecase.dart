import 'package:base_flutter/domain/repositories/app_repository.dart';

class CompleteOnboardingUseCase {
  final AppRepository _repository;

  CompleteOnboardingUseCase(this._repository);

  void setOnboardingComplete() {
    _repository.setOnboardingComplete();
  }
}
