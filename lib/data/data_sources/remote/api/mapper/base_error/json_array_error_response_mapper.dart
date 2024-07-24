import 'package:base_flutter/data/data_sources/remote/api/mapper/export.dart';
import 'package:base_flutter/data/models/base/export.dart';

class JsonArrayErrorResponseMapper
    extends BaseErrorResponseMapper<List<dynamic>> {
  @override
  ServerError mapToEntity(List<dynamic>? data) {
    return ServerError(
      errors: data
              ?.map((jsonObject) => ServerErrorDetail(
                    serverStatusCode: jsonObject['code'],
                    message: jsonObject['message'],
                  ))
              .toList(growable: false) ??
          [],
    );
  }
}
