import 'package:flutter/cupertino.dart';

import 'package:base_flutter/domain/usecases/base/base_input.dart';

abstract class UseCase<@required Input extends BaseInput, Output> {
  Future<Output> buildUseCase(Input input);

  Future execute(Input input) async {
    return await buildUseCase(input);
  }

  Future<void> dispose() => throw UnimplementedError();
}
