import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wity_post/common/posts.dart';
import 'package:wity_post/providers/theme_provider.dart';

class PostView extends StatelessWidget {
  final PostInfo postInfo;

  const PostView({
    super.key,
    required this.postInfo,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    final List<Widget> items = [];

    items.add(
      Row(
        children: [
          Text(
            postInfo.title ?? 'New post',
            style: TextStyle(
              color: themeProvider.primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          IconButton(
            onPressed: () async {
              final urlInfo = Uri.parse(postInfo.postUrl);
              await launchUrl(urlInfo);
            },
            icon: const Icon(
              Icons.open_in_new,
              size: 16,
            ),
          )
        ],
      ),
    );

    items.add(const _Separator());

    if (postInfo.imageUrl != null) {
      items.add(
        Container(
          width: double.infinity,
          alignment: Alignment.topCenter,
          child: Image.network(postInfo.imageUrl!),
        ),
      );

      items.add(const _Separator());
    }

    if (postInfo.description != null) {
      items.add(
        Text(
          '${postInfo.description}...',
          style: TextStyle(
            color: themeProvider.primaryColor,
            fontSize: 16,
          ),
        ),
      );
    }

    return Container(
      alignment: Alignment.topLeft,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
        children: items,
      ),
    );
  }
}

class _Separator extends StatelessWidget {
  const _Separator();

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: themeProvider.primaryColor.withOpacity(0.2),
          ),
        ),
      ),
    );
  }
}
