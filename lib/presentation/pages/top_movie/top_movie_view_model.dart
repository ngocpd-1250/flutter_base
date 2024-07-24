import 'package:injectable/injectable.dart';
import 'package:riverpod/riverpod.dart';

import 'package:base_flutter/domain/entities/movie.dart';
import 'package:base_flutter/domain/interactor/input/empty_input.dart';
import 'package:base_flutter/domain/usecases/get_top_rated_movies.dart';
import 'package:base_flutter/presentation/pages/base/base_view_model.dart';

@LazySingleton()
class TopMovieViewModel extends BaseViewModel {
  TopMovieViewModel(
    this._getTopRatedMoviesUseCase,
  );

  final GetTopRatedMoviesUseCase _getTopRatedMoviesUseCase;

  AsyncValue<List<Movie>> get topRatedMovies => _topRatedMovies;
  AsyncValue<List<Movie>> _topRatedMovies = const AsyncValue.loading();

  void getTopRatedMovies() {
    launchUseCase(
      useCase: _getTopRatedMoviesUseCase,
      input: EmptyInput.instance,
      onSubscribe: () {
        _topRatedMovies = const AsyncValue.loading();
      },
      onSuccess: (data) {
        _topRatedMovies = AsyncValue.data(data);
      },
      onError: (error) {
        _topRatedMovies = AsyncValue.error(error, StackTrace.empty);
      },
    );
  }
}
