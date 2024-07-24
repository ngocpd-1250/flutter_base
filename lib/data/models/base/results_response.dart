import 'package:freezed_annotation/freezed_annotation.dart';

part 'results_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ResultsListResponse<T> {
  ResultsListResponse({
    @JsonKey(name: 'page') this.page,
    @JsonKey(name: 'results') this.results,
    @JsonKey(name: 'total_pages') this.totalPages,
    @JsonKey(name: 'total_results') this.totalResults,
  });

  factory ResultsListResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonT,
  ) =>
      _$ResultsListResponseFromJson(json, fromJsonT);

  final int? page;
  final List<T>? results;
  final int? totalPages;
  final int? totalResults;

  Map<String, dynamic> toJson(Object Function(T) toJsonT) =>
      _$ResultsListResponseToJson(this, toJsonT);
}
