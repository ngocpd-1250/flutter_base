import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_data.freezed.dart';
part 'movie_data.g.dart';

@freezed
class MovieData with _$MovieData {
  const factory MovieData({
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
  }) = _MovieData;

  factory MovieData.fromJson(Map<String, dynamic> json) =>
      _$MovieDataFromJson(json);
}
