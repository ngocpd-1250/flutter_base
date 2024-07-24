import 'package:base_flutter/data/data_sources/remote/api/mapper/export.dart';

class JsonObjectResponseMapper<T> extends BaseSuccessResponseMapper<T, T> {
  @override
  T map(dynamic response, Decoder<T>? decoder) {
    return decoder != null && response is Map<String, dynamic>
        ? decoder(response)
        : response;
  }
}
