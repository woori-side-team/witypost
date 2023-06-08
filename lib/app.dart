import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wity_post/common/routes.dart';
import 'package:wity_post/presentation/providers/theme_provider.dart';
import 'package:wity_post/presentation/widgets/app_background.dart';
import 'package:wity_post/presentation/widgets/custom_app_bar.dart';
import 'package:wity_post/presentation/widgets/post_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final customThemeData = ThemeData(
      fontFamily: 'Pretendard',
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (providersContext) => ThemeProvider())
      ],
      child: MaterialApp.router(
        title: 'wity',
        theme: customThemeData,
        routerConfig: _router,
      ),
    );
  }
}

final _router = GoRouter(
  initialLocation: '/post',
  routes: [
    GoRoute(
      name: RouteNames.post,
      path: '/post',
      pageBuilder: (context, state) => _CustomPage(body: const PostPage()),
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
                    child: Column(
                      children: [
                        const CustomAppBar(),
                        Expanded(
                          child:
                              FadeTransition(opacity: animation, child: body),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
}
