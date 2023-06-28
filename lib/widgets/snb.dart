import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:witypost/providers/theme_provider.dart';

class SNB extends StatelessWidget {
  const SNB({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: SizedBox(
        width: 244,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 56,
              decoration: BoxDecoration(
                  color: themeProvider.neutral0Color,
                  borderRadius: BorderRadius.circular(8),),
              child: Text(
                '온보딩에 읽기 좋은 글',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: themeProvider.neutral1000Color,
                ),
              ),
            ),
            const SizedBox(height: 56),
            _MenuButton(label: '디자이너', onPressed: () {})
          ],
        ),
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  const _MenuButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return  InkWell(
        onTap: onPressed,
        child: Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  color: themeProvider.neutral1000Color,
                ),
              )
            ],
          ),
        ),
    );
  }
}
