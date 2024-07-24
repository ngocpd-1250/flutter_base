// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:base_flutter/data/data_sources/remote/api/auth_api_client.dart'
    as _i87;
import 'package:base_flutter/data/data_sources/remote/api/interceptor/auth_token_interceptor.dart'
    as _i122;
import 'package:base_flutter/data/data_sources/remote/api/interceptor/export.dart'
    as _i567;
import 'package:base_flutter/data/data_sources/remote/api/interceptor/header_interceptor.dart'
    as _i1033;
import 'package:base_flutter/data/data_sources/remote/api/mapper/movie_mapper.dart'
    as _i580;
import 'package:base_flutter/data/data_sources/remote/api/movie_api.dart'
    as _i113;
import 'package:base_flutter/data/data_sources/remote/api/none_auth_api_client.dart'
    as _i263;
import 'package:base_flutter/data/data_sources/shared_preference/app_shared_preference.dart'
    as _i276;
import 'package:base_flutter/data/repositories/movie_repository_implement.dart'
    as _i166;
import 'package:base_flutter/di/di.dart' as _i114;
import 'package:base_flutter/domain/repositories/movie_repository.dart'
    as _i168;
import 'package:base_flutter/domain/usecases/get_top_rated_movies.dart' as _i12;
import 'package:base_flutter/presentation/pages/top_movie/top_movie_view_model.dart'
    as _i881;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final serviceModule = _$ServiceModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => serviceModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i580.MovieMapper>(() => _i580.MovieMapper());
    gh.factory<_i1033.HeaderInterceptor>(() => _i1033.HeaderInterceptor());
    gh.lazySingleton<_i263.NoneAuthApiClient>(
        () => _i263.NoneAuthApiClient(gh<_i567.HeaderInterceptor>()));
    gh.lazySingleton<_i276.AppPreferences>(
        () => _i276.AppPreferences(gh<_i460.SharedPreferences>()));
    gh.factory<_i122.AuthTokenInterceptor>(() =>
        _i122.AuthTokenInterceptor(appPreferences: gh<_i276.AppPreferences>()));
    gh.lazySingleton<_i113.MovieApi>(
        () => _i113.MovieApi(gh<_i263.NoneAuthApiClient>()));
    gh.lazySingleton<_i168.MovieRepository>(
        () => _i166.MovieRepositoryImplement(
              gh<_i113.MovieApi>(),
              gh<_i580.MovieMapper>(),
            ));
    gh.lazySingleton<_i87.AuthApiClient>(() => _i87.AuthApiClient(
          gh<_i567.HeaderInterceptor>(),
          gh<_i567.AuthTokenInterceptor>(),
        ));
    gh.lazySingleton<_i12.GetTopRatedMoviesUseCase>(
        () => _i12.GetTopRatedMoviesUseCase(gh<_i168.MovieRepository>()));
    gh.lazySingleton<_i881.TopMovieViewModel>(
        () => _i881.TopMovieViewModel(gh<_i12.GetTopRatedMoviesUseCase>()));
    return this;
  }
}

class _$ServiceModule extends _i114.ServiceModule {}
