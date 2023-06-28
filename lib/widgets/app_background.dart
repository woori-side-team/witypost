import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:witypost/providers/theme_provider.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: themeProvider.neutral200Color,
      ),
    );
  }
}
