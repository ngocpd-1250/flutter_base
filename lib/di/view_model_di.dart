import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:base_flutter/di/di.dart';
import 'package:base_flutter/presentation/pages/top_movie/top_movie_view_model.dart';

final topMovieModelProvider =
    ChangeNotifierProvider.autoDispose<TopMovieViewModel>(
  (ref) => getIt<TopMovieViewModel>(),
);
