import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key, required this.isLoading});

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isLoading ? const CircularProgressIndicator() : const SizedBox(),
    );
  }
}
