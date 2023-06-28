import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:witypost/common/assets.dart';
import 'package:witypost/common/posts.dart';
import 'package:witypost/providers/theme_provider.dart';
import 'package:witypost/widgets/scrollbar.dart';

class PostGrid extends StatefulWidget {
  final String title;
  final String description;

  const PostGrid({super.key, required this.title, required this.description});

  @override
  State<StatefulWidget> createState() {
    return _PostGridState();
  }
}

class _PostGridState extends State<PostGrid> {
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

  void _moveScroll(double scale) {
    _scrollController.animateTo(
      _scrollController.position.extentBefore + 160 * scale,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void _moveLeft() {
    _moveScroll(-1);
  }

  void _moveRight() {
    _moveScroll(1);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    color: themeProvider.neutral1000Color,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  widget.description,
                  style: TextStyle(
                    color: themeProvider.neutral600Color,
                    fontSize: 16,
                  ),
                )
              ],
            ),
            const Spacer(),
            _GridButton(
              onPressed: _moveLeft,
              child: SvgPicture.asset(Assets.postGridPrev, width: 24),
            ),
            const SizedBox(width: 8),
            _GridButton(
              onPressed: _moveRight,
              child: SvgPicture.asset(Assets.postGridNext, width: 24),
            ),
          ],
        ),
        const SizedBox(height: 40),
        SizedBox(
          height: 590,
          child: NoScrollbar(
            child: GridView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              physics: const ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                childAspectRatio: 253 / 328,
                mainAxisExtent: 328,
              ),
              itemCount: postInfos.length,
              itemBuilder: (gridContext, index) =>
                  _PostCard(postInfo: postInfos[index]),
            ),
          ),
        ),
      ],
    );
  }
}

class _GridButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget child;

  const _GridButton({required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 10,
            spreadRadius: 0,
            color: Color.fromRGBO(0, 0, 0, 0.25),
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          customBorder: const CircleBorder(),
          child: child,
        ),
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  final PostInfo postInfo;

  const _PostCard({required this.postInfo});

  void _openPost() {
    launchUrl(Uri.parse(postInfo.postUrl));
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final imageUrl = postInfo.imageUrl;

    return SizedBox(
      width: 328,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: 200,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              // 이미지 위에 잉크 효과 넣기 위해 Stack으로 InkWell을 이미지 위에 쌓기.
              // https://robatokim.tistory.com/entry/Flutter-InkWell-on-image-잉크웰을-이미지-위에서-작동시키기
              child: Stack(
                alignment: Alignment.center,
                children: [
                  imageUrl == null
                      ? Container()
                      : Image.network(
                          imageUrl,
                          width: double.infinity,
                        ),
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(onTap: _openPost),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: _openPost,
              child: Text(
                postInfo.title ?? 'Post',
                style: TextStyle(
                  color: themeProvider.neutral1000Color,
                  height: 20.0 / 17.0,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            postInfo.description ?? '',
            style: TextStyle(
              color: themeProvider.neutral600Color,
              height: 17.0 / 14.0,
              fontSize: 14,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
