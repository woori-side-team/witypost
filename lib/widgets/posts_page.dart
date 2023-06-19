import 'package:flutter/material.dart';
import 'package:witypost/common/posts.dart';
import 'package:witypost/widgets/post_view.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: postInfos.length,
      itemBuilder: (listContext, index) => Container(
        width: double.infinity,
        // Container 때문에 자식의 constraint 설정이 무시되는 현상 있는데, 방지 위해 일부러 alignment 설정.
        // https://stackoverflow.com/a/54126643
        alignment: Alignment.topCenter,
        child: PostView(postInfo: postInfos[index]),
      ),
    );
  }
}
