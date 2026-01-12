import 'package:flutter/material.dart';
import 'package:instagram_clone_main/util/dimensions.dart';
import 'package:instagram_clone_main/util/text.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.avatarUrl,
    required this.posts,
    required this.followers,
    required this.following,
  });

  final String avatarUrl;
  final String posts;
  final String followers;
  final String following;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Container(
          width: Dimensions.profileAvatarSize,
          height: Dimensions.profileAvatarSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: theme.dividerColor, width: 1.2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: ClipOval(
              child: Image.network(
                avatarUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: theme.cardColor,
                  alignment: Alignment.center,
                  child: Icon(Icons.person, color: theme.hintColor),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: Dimensions.space18),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _StatBlock(value: posts, label: AppText.posts),
              _StatBlock(value: followers, label: AppText.followers),
              _StatBlock(value: following, label: AppText.following),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatBlock extends StatelessWidget {
  const _StatBlock({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: Dimensions.space2),
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
