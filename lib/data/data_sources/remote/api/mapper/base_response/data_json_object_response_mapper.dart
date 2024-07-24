import 'package:base_flutter/data/data_sources/remote/api/mapper/export.dart';
import 'package:base_flutter/data/models/base/export.dart';

class DataJsonObjectResponseMapper<T>
    extends BaseSuccessResponseMapper<T, DataResponse<T>> {
  @override
  DataResponse<T> map(dynamic response, Decoder<T>? decoder) {
    return decoder != null && response is Map<String, dynamic>
        ? DataResponse.fromJson(response, (json) => decoder(json))
        : DataResponse<T>(data: response);
  }
}
