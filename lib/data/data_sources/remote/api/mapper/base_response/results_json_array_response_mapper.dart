import 'package:base_flutter/data/data_sources/remote/api/mapper/export.dart';
import 'package:base_flutter/data/models/base/export.dart';

class ResultsJsonArrayResponseMapper<T>
    extends BaseSuccessResponseMapper<T, ResultsListResponse<T>> {
  @override
  ResultsListResponse<T> map(dynamic response, Decoder<T>? decoder) {
    return decoder != null && response is Map<String, dynamic>
        ? ResultsListResponse.fromJson(response, (json) => decoder(json))
        : ResultsListResponse<T>(results: response);
  }
}
