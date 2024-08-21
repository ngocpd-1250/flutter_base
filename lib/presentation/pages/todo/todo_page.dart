import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoPage extends ConsumerWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(
        child: Text("Todo Page"),
      ),
    );
  }
}
