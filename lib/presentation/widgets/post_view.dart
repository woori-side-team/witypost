import 'package:flutter/material.dart';
import 'package:metadata_fetch/metadata_fetch.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
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
  final String url;

  const PostView({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

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
      child: FutureBuilder(
        future: MetadataFetch.extract(url),
        builder: (futureBuilderContext, snapshot) {
          final data = snapshot.data;

          if (data == null) {
            return const Text('Loading...');
          }

          final title = data.title ?? 'Unknown title';
          final imageURL = data.image;
          final description = data.description ?? '';

          final List<Widget> items = [];

          items.add(
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: themeProvider.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    final urlInfo = Uri.parse(url);
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

          if (imageURL != null) {
            items.add(
              Container(
                width: double.infinity,
                alignment: Alignment.topCenter,
                child: Image.network(imageURL),
              ),
            );

            items.add(const _Separator());
          }

          items.add(
            Text(
              '$description...',
              style: TextStyle(
                color: themeProvider.primaryColor,
                fontSize: 16,
              ),
            ),
          );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items,
          );
        },
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
