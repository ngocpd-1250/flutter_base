import 'package:base_flutter/data/data_sources/remote/api/mapper/export.dart';

class ResponseMapperConstants {
  const ResponseMapperConstants._();
  static const defaultErrorResponseMapperType =
      ErrorResponseMapperType.jsonObject;
  static const defaultSuccessResponseMapperType =
      SuccessResponseMapperType.dataJsonObject;
}
