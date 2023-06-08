import 'package:flutter/material.dart';
import 'package:wity_post/presentation/widgets/post_view.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Post> dummyPosts = [
      const Post(url: '', title: '리액트 튜토리얼', imageURL: '', description: ''),
      const Post(url: '', title: '리액트 튜토리얼', imageURL: '', description: ''),
      const Post(url: '', title: '리액트 튜토리얼', imageURL: '', description: ''),
      const Post(url: '', title: '리액트 튜토리얼', imageURL: '', description: ''),
      const Post(url: '', title: '리액트 튜토리얼', imageURL: '', description: ''),
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
            children: dummyPosts.map((post) => PostView(post: post)).toList(),
          ),
        ),
      ),
    );
  }
}
