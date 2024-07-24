import 'package:base_flutter/data/data_sources/remote/api/mapper/export.dart';
import 'package:base_flutter/data/models/base/export.dart';

class RecordsJsonArrayResponseMapper<T>
    extends BaseSuccessResponseMapper<T, RecordsListResponse<T>> {
  @override
  RecordsListResponse<T> map(dynamic response, Decoder<T>? decoder) {
    return decoder != null && response is Map<String, dynamic>
        ? RecordsListResponse.fromJson(response, (json) => decoder(json))
        : RecordsListResponse<T>(records: response);
  }
}
