import 'package:base_flutter/data/data_sources/remote/api/mapper/export.dart';
import 'package:base_flutter/data/models/base/export.dart';

class DataJsonArrayResponseMapper<T>
    extends BaseSuccessResponseMapper<T, DataListResponse<T>> {
  @override
  DataListResponse<T> map(dynamic response, Decoder<T>? decoder) {
    return decoder != null && response is Map<String, dynamic>
        ? DataListResponse.fromJson(response, (json) => decoder(json))
        : DataListResponse<T>(data: response);
  }
}
