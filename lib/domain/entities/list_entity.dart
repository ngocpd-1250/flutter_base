class ListEntity<T> {
  ListEntity({
    this.results,
    this.totalPages,
  });

  List<T>? results;

  int? totalPages;
}
