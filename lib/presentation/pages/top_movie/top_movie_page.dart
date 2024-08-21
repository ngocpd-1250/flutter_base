import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class TopMoviePage extends ConsumerWidget {
  const TopMoviePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(
        child: Text("Top Movie Page"),
      ),
    );
  }
}
