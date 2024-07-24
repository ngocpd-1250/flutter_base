import 'package:injectable/injectable.dart';

import 'package:base_flutter/domain/entities/movie.dart';
import 'package:base_flutter/domain/interactor/input/empty_input.dart';
import 'package:base_flutter/domain/repositories/movie_repository.dart';
import 'package:base_flutter/domain/usecases/base/base_use_case.dart';

@LazySingleton()
class GetTopRatedMoviesUseCase extends BaseUseCase<EmptyInput, List<Movie>> {
  GetTopRatedMoviesUseCase(this.movieRepository);

  final MovieRepository movieRepository;

  @override
  Future<List<Movie>> buildUseCase(EmptyInput input) {
    return movieRepository.getTopRatedMovies();
  }
}
