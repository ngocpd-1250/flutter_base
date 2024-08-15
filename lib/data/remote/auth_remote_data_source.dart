import 'package:base_flutter/data/base/data_source.dart';
import 'package:base_flutter/data/model/auth_token.dart';

class AuthRemoteDataSource with DataSource {
  Future<AuthToken> login(String username, String password) async {
    final response = await excuse(() async {
      await Future.delayed(const Duration(seconds: 3));
      return AuthToken(
          accessToken: "accessToken_response_${username}_$password",
          refreshToken: "refreshToken_response_${username}_$password");
    });
    return response;
  }
}
