import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'package:base_flutter/data/model/movie_detail.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio) = _AuthApi;

  @GET('/movie/{movieId}')
  Future<MovieDetail> getMovieDetail(
    @Path('movieId') int movieId,
    @Query('api_key') String apiKey,
  );
}
