import 'package:base_flutter/data/data_sources/remote/api/mapper/export.dart';
import 'package:base_flutter/data/models/base/export.dart';

abstract class BaseErrorResponseMapper<T>
    extends BaseDataMapper<T, ServerError> {
  const BaseErrorResponseMapper();

  factory BaseErrorResponseMapper.fromType(ErrorResponseMapperType type) {
    switch (type) {
      case ErrorResponseMapperType.jsonObject:
        return JsonObjectErrorResponseMapper() as BaseErrorResponseMapper<T>;
      case ErrorResponseMapperType.jsonArray:
        return JsonArrayErrorResponseMapper() as BaseErrorResponseMapper<T>;
    }
  }
}
