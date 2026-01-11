import 'package:flutter/material.dart';

import '../../home/widgets/story_bubble.dart';
import '../../home/domain/models/story_model.dart';

class HighlightsRow extends StatelessWidget {
  const HighlightsRow({super.key, required this.highlights, required this.onTap});

  final List<StoryModel> highlights;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 108,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: highlights.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          return StoryBubble(
            story: highlights[index],
            onTap: onTap,
          );
        },
      ),
    );
  }
}
