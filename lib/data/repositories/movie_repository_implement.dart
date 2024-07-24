import 'package:injectable/injectable.dart';

import 'package:base_flutter/data/data_sources/remote/api/mapper/movie_mapper.dart';
import 'package:base_flutter/data/data_sources/remote/api/movie_api.dart';
import 'package:base_flutter/domain/entities/movie.dart';
import 'package:base_flutter/domain/repositories/movie_repository.dart';

@LazySingleton(as: MovieRepository)
class MovieRepositoryImplement implements MovieRepository {
  MovieRepositoryImplement(
    this.movieApi,
    this.movieMapper,
  );

  final MovieApi movieApi;
  final MovieMapper movieMapper;

  @override
  Future<List<Movie>> getTopRatedMovies() async {
    final data = await movieApi.getTopRatedMovies();
    final movies = data.results ?? [];

    return movies.map((movie) => movieMapper.mapToEntity(movie)).toList();
  }
}
