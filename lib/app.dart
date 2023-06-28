import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:witypost/common/routes.dart';
import 'package:witypost/providers/theme_provider.dart';
import 'package:witypost/widgets/app_background.dart';
import 'package:witypost/widgets/gnb.dart';
import 'package:witypost/widgets/posts_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (providersContext) => ThemeProvider())
      ],
      child: const _ThemedContent(),
    );
  }
}

class _ThemedContent extends StatelessWidget {
  const _ThemedContent();

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    final customThemeData = ThemeData(
      fontFamily: 'Pretendard',
      scrollbarTheme: const ScrollbarThemeData().copyWith(
        thumbColor: MaterialStateProperty.all(
          themeProvider.neutral1000Color.withOpacity(0.5),
        ),
      ),
    );

    return MaterialApp.router(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      title: 'wity',
      theme: customThemeData,
      routerConfig: _router,
    );
  }
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: routeNames.home,
      path: '/',
      pageBuilder: (context, state) => _CustomPage(body: const PostsPage()),
    )
  ],
);

class _CustomPage extends CustomTransitionPage {
  final Widget body;

  _CustomPage({required this.body})
      : super(
          child: body,
          transitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return Scaffold(
              body: Stack(
                children: [
                  const AppBackground(),
                  // 배경이 앞쪽 widget들의 애니메이션을 가리는 현상이 있어, 앞쪽 widget들을 Material로 한번 감싸줌.
                  Material(
                    color: Colors.transparent,
                    // GNB가 항상 제일 위에 그려지도록, 밑에서부터 거꾸로 쌓음.
                    child: Column(
                      verticalDirection: VerticalDirection.up,
                      children: [
                        Expanded(
                          child:
                              FadeTransition(opacity: animation, child: body),
                        ),
                        const GNB(),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
}
