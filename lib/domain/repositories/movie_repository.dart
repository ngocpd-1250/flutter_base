import 'package:base_flutter/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getTopRatedMovies();
}
