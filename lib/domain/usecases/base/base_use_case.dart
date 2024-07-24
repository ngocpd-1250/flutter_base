import 'package:base_flutter/domain/interactor/input/base_input.dart';
import 'package:base_flutter/domain/interactor/output/output.dart';

abstract class BaseUseCase<Input extends BaseInput, Output> {
  Future<Output> buildUseCase(Input input);

  Future call(Input input, OutputObserver<Output> block) async {
    block.callSubscribe();
    try {
      final data = await buildUseCase(input);
      block.callSuccess(data);
    } catch (e) {
      block.callError(e);
    }
  }
}
