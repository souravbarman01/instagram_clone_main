import 'package:flutter/material.dart';
import 'package:instagram_clone/features/home/widgets/story_bubble.dart';
import '../domain/models/demo_avatars.dart';
import '../domain/models/story_model.dart';

class StoriesHeaderSection extends StatelessWidget {
  const StoriesHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <StoryModel>[
      const StoryModel(name: 'Your Story', imageUrl: demoAvatar1, isYourStory: true),
      const StoryModel(name: 'karennne', imageUrl: demoAvatar2, isLive: true),
      const StoryModel(name: 'zackjohn', imageUrl: demoAvatar3),
      const StoryModel(name: 'kieron_d', imageUrl: demoAvatar4),
      const StoryModel(name: 'craig_love', imageUrl: demoAvatar5),
      const StoryModel(name: 'anna', imageUrl: demoAvatar6),
    ];


    return SizedBox(
      height: 115,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final story = items[index];
          return StoryBubble(
            story: story,
            onTap: () {},
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemCount: items.length,
      ),
    );
  }
}
