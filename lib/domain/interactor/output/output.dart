class OutputObserver<Output> {
  Function()? _onSubscribe;
  Function(Output)? _onSuccess;
  Function(Object)? _onError;

  void onSubscribe(Function() block) {
    _onSubscribe = block;
  }

  void onSuccess(Function(Output) block) {
    _onSuccess = block;
  }

  void onError(Function(Object)? block) {
    _onError = block;
  }

  void callSubscribe() => _onSubscribe?.call();

  void callSuccess(Output output) => _onSuccess?.call(output);

  void callError(Object error) => _onError?.call(error);
}
