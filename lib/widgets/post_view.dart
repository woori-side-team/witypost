import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wity_post/providers/theme_provider.dart';
import 'package:wity_post/repositories/api_repository.dart';

class PostView extends StatelessWidget {
  final String postUrl;

  const PostView({
    super.key,
    required this.postUrl,
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
        future: apiRepository.getPost(postUrl),
        builder: (futureBuilderContext, snapshot) {
          final postModel = snapshot.data;

          if (postModel == null) {
            return const Text('Loading...');
          }

          final List<Widget> items = [];

          items.add(
            Row(
              children: [
                Text(
                  postModel.title,
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
            ),
          );

          items.add(const _Separator());

          if (postModel.imageUrl != null) {
            items.add(
              Container(
                width: double.infinity,
                alignment: Alignment.topCenter,
                child: Image.network(
                  apiRepository.getForwardUrl(postModel.imageUrl!),
                ),
              ),
            );

            items.add(const _Separator());
          }

          if (postModel.description != null) {
            items.add(
              Text(
                '${postModel.description}...',
                style: TextStyle(
                  color: themeProvider.primaryColor,
                  fontSize: 16,
                ),
              ),
            );
          }

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
