import 'package:flutter/material.dart';
import 'package:witypost/widgets/post_grid.dart';
import 'package:witypost/widgets/scrollbar.dart';
import 'package:witypost/widgets/snb.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PostsPageState();
  }
}

class _PostsPageState extends State<PostsPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final windowSize = MediaQuery.of(context).size;
    final hideSNB = windowSize.width <= 700 || windowSize.height <= 500;

    // 스크롤바는 화면 오른쪽 끝에 있지만 실제로는 안쪽 내용물과 연동.
    return Scrollbar(
      controller: _scrollController,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...(hideSNB ? [] : [const SizedBox(width: 24), const SNB()]),
          // 화면이 넓으면 지정 너비만큼, 좁으면 그냥 남은 너비 채우도록 하기.
          // Flexible + infinity + maxWidth
          // https://stackoverflow.com/a/69899586
          Flexible(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              constraints: const BoxConstraints(maxWidth: 900),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: NoScrollbar(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  clipBehavior: Clip.none,
                  child: const Column(
                    children: [
                      SizedBox(height: 60),
                      PostGrid(
                          title: '온보딩', description: '첫 발을 떼는 당신에게 도움되는 글',),
                      SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
