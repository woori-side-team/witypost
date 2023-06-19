import 'package:flutter/material.dart';
import 'package:witypost/common/posts.dart';
import 'package:witypost/widgets/post_view.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        width: double.infinity,
        // Container 때문에 ConstraintedBox 설정이 무시되는 현상 있는데, 방지 위해 일부러 alignment 설정.
        // https://stackoverflow.com/a/54126643
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            children: postInfos
                .map((postInfo) => PostView(postInfo: postInfo))
                .toList(),
          ),
        ),
      ),
    );
  }
}
