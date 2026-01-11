import 'package:flutter/material.dart';

import '../domain/models/demo_avatars.dart';

class DummyPostSection extends StatelessWidget {
  const DummyPostSection({super.key});

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
                backgroundImage: NetworkImage(demoAvatar3),
                onBackgroundImageError: (_, __) {},
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 12,
                      width: 120,
                      color: theme.dividerColor.withValues(alpha: 0.35),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      height: 10,
                      width: 90,
                      color: theme.dividerColor.withValues(alpha: 0.25),
                    ),
                  ],
                ),
              ),
              Icon(Icons.more_horiz, color: theme.hintColor),
            ],
          ),
        ),
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            color: theme.dividerColor.withValues(alpha: 0.25),
            alignment: Alignment.center,
            child: Text(
              'Post media (next prompt)',
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              Icon(Icons.favorite_border, color: theme.textTheme.bodyLarge?.color),
              const SizedBox(width: 16),
              Icon(Icons.chat_bubble_outline, color: theme.textTheme.bodyLarge?.color),
              const SizedBox(width: 16),
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
              Container(
                height: 12,
                width: 220,
                color: theme.dividerColor.withValues(alpha: 0.25),
              ),
              const SizedBox(height: 10),
              Container(
                height: 12,
                width: 280,
                color: theme.dividerColor.withValues(alpha: 0.20),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

