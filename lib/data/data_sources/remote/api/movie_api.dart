import 'package:injectable/injectable.dart';

import 'package:base_flutter/data/data_sources/remote/api/client/export.dart';
import 'package:base_flutter/data/data_sources/remote/api/mapper/export.dart';
import 'package:base_flutter/data/data_sources/remote/api/none_auth_api_client.dart';
import 'package:base_flutter/data/models/base/export.dart';
import 'package:base_flutter/data/models/movie_data.dart';

@LazySingleton()
class MovieApi {
  MovieApi(
    this._noneAuthApiClient,
  );

  final NoneAuthApiClient _noneAuthApiClient;

  Future<ResultsListResponse<MovieData>> getTopRatedMovies() async {
    return _noneAuthApiClient.request(
      method: RestMethod.get,
      body: {},
      path: '/movie/top_rated',
      decoder: (json) => MovieData.fromJson(json),
      successResponseMapperType: SuccessResponseMapperType.resultsJsonArray,
    );
  }
}
