import 'package:base_flutter/data/data_sources/remote/api/exception/export.dart';

abstract class ExceptionMapper<T extends AppException> {
  T map(Object? exception);
}
