import 'package:json_annotation/json_annotation.dart';

import 'data_model.dart';

part 'auth_token.g.dart';

@JsonSerializable()
class AuthToken with DataModel {
  @JsonKey(name: 'access_token')
  final String accessToken;

  @JsonKey(name: 'refresh_token')
  final String? refreshToken;

  AuthToken({
    required this.accessToken,
    this.refreshToken,
  });

  AuthToken copyWith({
    String? accessToken,
    String? refreshToken,
  }) {
    return AuthToken(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  Map<String, dynamic> toJson() => _$AuthTokenToJson(this);

  factory AuthToken.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenFromJson(json);

  @override
  String toString() =>
      'Token(accessToken: $accessToken, refreshToken: $refreshToken)';
}
