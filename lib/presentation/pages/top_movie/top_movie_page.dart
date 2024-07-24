import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:base_flutter/di/view_model_di.dart';
import 'package:base_flutter/presentation/components/app_loading.dart';
import 'package:base_flutter/presentation/theme/app_them.dart';

class TopMoviePage extends ConsumerStatefulWidget {
  const TopMoviePage({super.key});

  @override
  TopMoviePageState createState() => TopMoviePageState();
}

class TopMoviePageState extends ConsumerState<TopMoviePage> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final viewModel = ref.read(topMovieModelProvider);
      viewModel.getTopRatedMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.appColors.backgroundPrimary,
      body: Consumer(builder: (context, ref, child) {
        final movies = ref
                .watch(
                  topMovieModelProvider.select((value) => value.topRatedMovies),
                )
                .value ??
            [];
        final isLoading = ref.watch(
          topMovieModelProvider.select((value) => value.isLoading),
        );

        return Stack(
          children: [
            ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return ListTile(
                  leading: Image.network(
                    'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(movie.title),
                  subtitle: Text(movie.overview),
                );
              },
            ),
            if (isLoading)
              Positioned.fill(
                child: Center(
                  child: AppLoading(isLoading: isLoading),
                ),
              ),
          ],
        );
      }),
    );
  }
}
