import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        color: Colors.black.withOpacity(0.25),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
