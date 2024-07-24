import 'package:flutter/material.dart';

import 'package:base_flutter/domain/interactor/input/base_input.dart';
import 'package:base_flutter/domain/interactor/output/output.dart';
import 'package:base_flutter/domain/usecases/base/base_use_case.dart';

abstract class BaseViewModel extends ChangeNotifier {
  bool get isLoading => _isLoading;
  bool _isLoading = false;
  int _loadingCount = 0;

  Future launchUseCase<I extends BaseInput, O>({
    required BaseUseCase<I, O> useCase,
    required I input,
    bool shouldShowLoading = true,
    VoidCallback? onSubscribe,
    Function(O data)? onSuccess,
    Function(Object error)? onError,
  }) async {
    await useCase.call(
      input,
      OutputObserver()
        ..onSubscribe(() {
          onSubscribe?.call();
          if (shouldShowLoading) {
            showLoading();
          }
          notifyListeners();
        })
        ..onSuccess((data) {
          onSuccess?.call(data);
          if (shouldShowLoading) {
            hideLoading();
          }
          notifyListeners();
        })
        ..onError((error) {
          onError?.call(error);
          if (shouldShowLoading) {
            hideLoading();
          }
          notifyListeners();
        }),
    );
  }

  void showLoading() {
    _loadingCount++;
    _isLoading = true;
  }

  void hideLoading() {
    _loadingCount--;
    if (_loadingCount <= 0) {
      _isLoading = false;
      _loadingCount = 0;
    }
  }
}
