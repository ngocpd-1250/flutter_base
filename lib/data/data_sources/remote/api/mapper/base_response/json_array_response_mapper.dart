import 'package:base_flutter/data/data_sources/remote/api/mapper/export.dart';

class JsonArrayResponseMapper<T> extends BaseSuccessResponseMapper<T, List<T>> {
  @override
  List<T> map(dynamic response, Decoder<T>? decoder) {
    return decoder != null && response is List
        ? response
            .map((jsonObject) => decoder(jsonObject))
            .toList(growable: false)
        : [response];
  }
}
