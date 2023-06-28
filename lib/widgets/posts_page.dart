import 'package:flutter/material.dart';
import 'package:witypost/widgets/post_grid.dart';
import 'package:witypost/widgets/snb.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SNB(),
        // 화면이 넓으면 지정 너비만큼, 좁으면 그냥 남은 너비 채우도록 하기.
        // Flexible + infinity + maxWidth
        // https://stackoverflow.com/a/69899586
        Flexible(
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 900),
            padding: const EdgeInsets.only(top: 60, bottom: 60, left: 24),
            child: const Column(
              children: [
                PostGrid(title: '온보딩', description: '첫 발을 떼는 당신에게 도움되는 글')
              ],
            ),
          ),
        ),
      ],
    );
  }
}
