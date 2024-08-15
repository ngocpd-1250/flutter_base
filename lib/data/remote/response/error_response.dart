import 'package:json_annotation/json_annotation.dart';

part 'error_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ErrorResponse {
  @JsonKey(name: 'status_code')
  final int? statusCode;

  @JsonKey(name: 'message')
  final String? message;

  ErrorResponse({
    this.statusCode,
    this.message,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);

  @override
  String toString() =>
      'ErrorResponse(statusCode: $statusCode, statusMessage: $message)';
}
