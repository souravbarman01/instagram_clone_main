import 'package:flutter/material.dart';
import 'package:instagram_clone/util/dimensions.dart';
import 'package:instagram_clone/util/text.dart';

import '../domain/models/post_model.dart';

class DummyPostSection extends StatelessWidget {
  const DummyPostSection({super.key, required this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(post.userAvatarUrl),
                onBackgroundImageError: (_, __) {},
              ),
              const SizedBox(width: Dimensions.space10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.userName,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      post.location,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.hintColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.more_horiz, color: theme.hintColor),
            ],
          ),
        ),
        _PostMediaCarousel(images: post.images),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              Icon(Icons.favorite_border, color: theme.textTheme.bodyLarge?.color),
              const SizedBox(width: Dimensions.space16),
              Icon(Icons.chat_bubble_outline, color: theme.textTheme.bodyLarge?.color),
              const SizedBox(width: Dimensions.space16),
              Icon(Icons.send_outlined, color: theme.textTheme.bodyLarge?.color),
              const Spacer(),
              Icon(Icons.bookmark_border, color: theme.textTheme.bodyLarge?.color),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${AppText.likedByPrefix}${post.likedByUser}${AppText.and}${post.likesCount}${AppText.others}',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: Dimensions.space10),
              RichText(
                text: TextSpan(
                  style: theme.textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: '${post.userName} ',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(text: post.caption),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: Dimensions.space12),
      ],
    );
  }
}

class _PostMediaCarousel extends StatefulWidget {
  const _PostMediaCarousel({required this.images});

  final List<String> images;

  @override
  State<_PostMediaCarousel> createState() => _PostMediaCarouselState();
}

class _PostMediaCarouselState extends State<_PostMediaCarousel> {
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: [
          Positioned.fill(
            child: PageView.builder(
              itemCount: widget.images.length,
              onPageChanged: (value) => setState(() => _page = value),
              itemBuilder: (context, index) {
                final url = widget.images[index];
                return Image.network(
                  url,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: theme.dividerColor.withValues(alpha: 0.25),
                    alignment: Alignment.center,
                    child: Text(
                      AppText.imageUnavailable,
                      style: theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor),
                    ),
                  ),
                );
              },
            ),
          ),
          if (widget.images.length > 1)
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(widget.images.length, (index) {
                  final isActive = index == _page;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    height: Dimensions.space6,
                    width: isActive ? Dimensions.space10 : Dimensions.space6,
                    decoration: BoxDecoration(
                      color: isActive ? theme.primaryColor : theme.dividerColor,
                      borderRadius: BorderRadius.circular(999),
                    ),
                  );
                }),
              ),
            ),
        ],
      ),
    );
  }
}
