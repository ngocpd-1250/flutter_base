import 'package:base_flutter/data/data_sources/remote/api/mapper/export.dart';
import 'package:base_flutter/data/models/base/export.dart';

class JsonObjectErrorResponseMapper
    extends BaseErrorResponseMapper<Map<String, dynamic>> {
  @override
  ServerError mapToEntity(Map<String, dynamic>? data) {
    return ServerError(
      generalServerStatusCode: data?['error']?['status_code'],
      generalServerErrorId: data?['error']?['error_code'],
      generalMessage: data?['error']?['message'],
    );
  }
}
