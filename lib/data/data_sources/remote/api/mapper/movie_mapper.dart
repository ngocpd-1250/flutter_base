import 'package:injectable/injectable.dart';

import 'package:base_flutter/data/data_sources/remote/api/mapper/export.dart';
import 'package:base_flutter/data/models/movie_data.dart';
import 'package:base_flutter/domain/entities/movie.dart';

@Injectable()
class MovieMapper extends BaseDataMapper<MovieData, Movie> {
  @override
  Movie mapToEntity(MovieData? data) {
    return Movie(
      id: data?.id ?? -1,
      adult: data?.adult ?? false,
      overview: data?.overview ?? '',
      popularity: data?.popularity ?? 0,
      backdropPath: data?.backdropPath ?? '',
      voteCount: data?.voteCount ?? 0,
      voteAverage: data?.voteAverage ?? 0,
      video: data?.video ?? false,
      releaseDate: data?.releaseDate ?? '',
    );
  }
}
