import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'package:base_flutter/data/model/auth_token.dart';
import 'package:base_flutter/data/remote/requests/refresh_token_request.dart';

part 'none_auth_api.g.dart';

@RestApi()
abstract class NoneAuthApi {
  factory NoneAuthApi(Dio dio) = _NoneAuthApi;

  @POST('/refresh_token')
  Future<AuthToken> refreshToken(@Body() RefreshTokenRequest request);
}
