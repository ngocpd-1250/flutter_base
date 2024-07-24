import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    required int id,
    @Default(false) bool adult,
    @Default('') String title,
    @Default('') String overview,
    @Default(0.0) double popularity,
    @Default('') String posterPath,
    @Default('') String backdropPath,
    @Default(0) int voteCount,
    @Default(0.0) double voteAverage,
    @Default(false) bool video,
    @Default('') String releaseDate,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
