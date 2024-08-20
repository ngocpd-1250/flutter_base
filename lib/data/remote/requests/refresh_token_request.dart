import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_request.g.dart';

@JsonSerializable()
class RefreshTokenRequest {
  RefreshTokenRequest({
    required this.refreshToken,
  });

  @JsonKey(name: 'refresh_token')
  final String refreshToken;
}