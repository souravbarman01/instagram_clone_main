import 'package:flutter/material.dart';
import 'package:instagram_clone_main/features/home/widgets/story_bubble.dart';
import 'package:instagram_clone_main/util/dimensions.dart';
import '../domain/models/story_model.dart';

class StoriesHeaderSection extends StatelessWidget {
  const StoriesHeaderSection({
    super.key,
    required this.stories,
    required this.isLoading,
    required this.errorMessage,
  });

  final List<StoryModel> stories;
  final bool isLoading;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const SizedBox(
        height: Dimensions.storyHeaderHeight,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (errorMessage != null) {
      return SizedBox(
        height: Dimensions.storyHeaderHeight,
        child: Center(child: Text(errorMessage!)),
      );
    }

    if (stories.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: Dimensions.storyHeaderHeight,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final story = stories[index];
          return StoryBubble(
            story: story,
            onTap: () {},
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: Dimensions.space14),
        itemCount: stories.length,
      ),
    );
  }
}
