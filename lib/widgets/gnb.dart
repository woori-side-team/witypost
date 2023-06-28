import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:witypost/common/assets.dart';
import 'package:witypost/providers/theme_provider.dart';

class GNB extends StatelessWidget {
  const GNB({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      alignment: Alignment.centerLeft,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(color: themeProvider.neutral0Color),
      child: const Row(
        children: [
          _Logo(),
          Spacer(),
          _ThemeButton(),
          SizedBox(width: 12),
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

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Assets.gnbLogo, width: 100),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'WOORIDLE',
              style: TextStyle(
                fontSize: 6,
                fontWeight: FontWeight.w700,
                color: themeProvider.logoColor,
              ),
            ),
            Text(
              ' IT COMMUNITY',
              style: TextStyle(
                fontSize: 6,
                fontWeight: FontWeight.w400,
                color: themeProvider.logoColor,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _ThemeButton extends StatelessWidget {
  const _ThemeButton();

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    CustomThemeMode nextThemeMode;
    String iconPath;

    if (themeProvider.themeMode == CustomThemeMode.light) {
      nextThemeMode = CustomThemeMode.dark;
      iconPath = Assets.gnbLight;
    } else {
      nextThemeMode = CustomThemeMode.light;
      iconPath = Assets.gnbDark;
    }

    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: IconButton(
        onPressed: () {
          themeProvider.themeMode = nextThemeMode;
        },
        icon: SvgPicture.asset(
          iconPath,
          width: 24,
          colorFilter:
              ColorFilter.mode(themeProvider.neutral1100Color, BlendMode.srcIn),
        ),
      ),
    );
  }
}

class _TalkButton extends StatelessWidget {
  static final Uri _talkURLInfo =
      Uri.parse('https://open.kakao.com/o/g7XAPWof');

  const _TalkButton();

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return ElevatedButton(
      onPressed: () {
        launchUrl(_talkURLInfo);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: themeProvider.neutral1100Color,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(54)),
      ),
      child: Text(
        '오픈카톡 참여하기',
        style: TextStyle(
          color: themeProvider.neutral0Color,
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
    );
  }
}
