import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProcessState<T> {
  AsyncValue<T>? value;

  void onSuccess(T data) {
    value = AsyncValue.data(data);
  }

  void onError(StackTrace error) {
    value = AsyncError(error, StackTrace.current);
  }

  void onLoading() {
    value = const AsyncLoading();
  }
}
