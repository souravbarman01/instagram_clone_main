import 'package:flutter/material.dart';
import 'package:instagram_clone_main/features/home/widgets/story_ring.dart';
import 'package:instagram_clone_main/util/dimensions.dart';

import '../domain/models/story_model.dart';

class StoryBubble extends StatelessWidget {
  const StoryBubble({super.key, required this.story, required this.onTap});

  final StoryModel story;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);


    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: SizedBox(
        width: Dimensions.storyBubbleWidth,
        child: Column(
          children: [
            StoryRing(
              imageUrl: story.imageUrl,
              showAddBadge: story.isYourStory,
              showLiveBadge: story.isLive,
            ),
            const SizedBox(height: Dimensions.space8),
            Text(
              story.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: 12.5,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
