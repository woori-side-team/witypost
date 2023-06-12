import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:wity_post/presentation/providers/theme_provider.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Expanded(child: _Logo()),
          _ThemeButton(),
          _TalkButton()
        ],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Text(
      'wity',
      style: TextStyle(
        color: themeProvider.highlightColor,
        fontSize: 24,
      ),
    );
  }
}

class _ThemeButton extends StatelessWidget {
  const _ThemeButton();

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return _AppBarButton(
      onPressed: () {
        if (themeProvider.themeMode == CustomThemeMode.light) {
          themeProvider.themeMode = CustomThemeMode.dark;
        } else {
          themeProvider.themeMode = CustomThemeMode.light;
        }
      },
      iconData: themeProvider.themeMode == CustomThemeMode.light
          ? Icons.light_mode
          : Icons.dark_mode,
    );
  }
}

class _TalkButton extends StatelessWidget {
  static final Uri _talkURLInfo =
      Uri.parse('https://open.kakao.com/o/g7XAPWof');

  const _TalkButton();

  @override
  Widget build(BuildContext context) {
    return _AppBarButton(
      onPressed: () async {
        await launchUrl(_talkURLInfo);
      },
      iconData: Icons.people,
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData iconData;

  const _AppBarButton({required this.onPressed, required this.iconData});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return IconButton(
      iconSize: 24,
      onPressed: onPressed,
      icon: Icon(
        iconData,
        color: themeProvider.primaryColor,
      ),
    );
  }
}
