import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wity_post/presentation/providers/theme_provider.dart';

class Post {
  final String url;
  final String title;
  final String description;
  final String imageURL;

  const Post({
    required this.url,
    required this.title,
    required this.imageURL,
    required this.description,
  });
}

class PostView extends StatelessWidget {
  final Post post;

  const PostView({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Container(
      alignment: Alignment.topLeft,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: themeProvider.backgroundColor,
        border: Border.all(
          color: themeProvider.primaryColor.withOpacity(0.4),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: themeProvider.primaryColor.withOpacity(0.2),
            offset: const Offset(1, 2),
          )
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title,
            style: TextStyle(
              color: themeProvider.primaryColor,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            alignment: Alignment.center,
            width: 400,
            height: 300,
            decoration: BoxDecoration(
              border: Border.all(
                color: themeProvider.primaryColor.withOpacity(0.8),
              ),
            ),
            child: Text(
              'Image',
              style: TextStyle(
                color: themeProvider.primaryColor,
                fontSize: 12,
              ),
            ),
          )
        ],
      ),
    );
  }
}
