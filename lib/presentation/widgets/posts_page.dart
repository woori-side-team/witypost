import 'package:flutter/material.dart';
import 'package:wity_post/presentation/widgets/post_view.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> dummyURLs = [
      'https://zero-base.co.kr/event/media_BE_school_roadmap',
      'https://velog.io/@lky5697/the-const-deception',
      'https://stackoverflow.com/questions/1273108/how-do-i-git-rm-a-file-without-deleting-it-from-disk',
      'https://velog.io/@baby_dev/%ED%94%84%EB%A1%A0%ED%8A%B8%EC%97%94%EB%93%9C-cicd-%EB%B9%8C%EB%93%9C-%EC%86%8D%EB%8F%84-%EC%B5%9C%EC%A0%81%ED%99%94-feat.-docker-multi-staging',
      'https://devconnected.com/how-to-remove-files-from-git-commit/'
    ];

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
            children: dummyURLs.map((url) => PostView(url: url)).toList(),
          ),
        ),
      ),
    );
  }
}
