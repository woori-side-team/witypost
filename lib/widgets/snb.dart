import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:witypost/common/assets.dart';
import 'package:witypost/providers/theme_provider.dart';

class SNB extends StatelessWidget {
  const SNB({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Container(
      height: 400,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(width: 1, color: themeProvider.neutral300Color),
        ),
      ),
      child: SizedBox(
        width: 244,
        child: Column(
          children: [
            Container(
              height: 56,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: themeProvider.neutral0Color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Text(
                    '온보딩에 읽기 좋은 글',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: themeProvider.neutral1000Color,
                    ),
                  ),
                  const Spacer(),
                  SvgPicture.asset(Assets.snbNext, width: 24)
                ],
              ),
            ),
            const SizedBox(height: 56),
            _MenuButton(label: '디자이너', onPressed: () {}),
            _MenuButton(label: '기획자', onPressed: () {}),
            _MenuButton(label: '개발자', onPressed: () {})
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

    return InkWell(
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
            ),
            const Spacer(),
            SvgPicture.asset(Assets.snbNext, width: 24)
          ],
        ),
      ),
    );
  }
}
