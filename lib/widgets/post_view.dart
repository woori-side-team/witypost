import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:witypost/common/posts.dart';
import 'package:witypost/providers/theme_provider.dart';

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
    final title = postInfo.title ?? 'Post';
    final postUrl = postInfo.postUrl;
    final imageUrl = postInfo.imageUrl;
    final description = postInfo.description;

    items.add(_TitleView(title: title, postUrl: postUrl));
    items.add(const _Separator());

    if (imageUrl != null) {
      items.add(_ImageView(imageUrl: imageUrl));
      items.add(const _Separator());
    }

    if (description != null) {
      items.add(_DescriptionView(description: description));
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

class _TitleView extends StatelessWidget {
  final String title;
  final String postUrl;

  const _TitleView({required this.title, required this.postUrl});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Row(
      children: [
        Text(
          title.trim(),
          style: TextStyle(
            color: themeProvider.primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        IconButton(
          onPressed: () async {
            final urlInfo = Uri.parse(postUrl);
            await launchUrl(urlInfo);
          },
          icon: const Icon(
            Icons.open_in_new,
            size: 16,
          ),
        )
      ],
    );
  }
}

class _ImageView extends StatelessWidget {
  final String imageUrl;

  const _ImageView({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.topCenter,
      child: Image.network(imageUrl),
    );
  }
}

class _DescriptionView extends StatelessWidget {
  final String description;

  const _DescriptionView({required this.description});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final tail = description.endsWith('...') ? '' : '...';

    return Text(
      '${description.trim()}$tail',
      style: TextStyle(
        color: themeProvider.primaryColor,
        fontSize: 16,
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
