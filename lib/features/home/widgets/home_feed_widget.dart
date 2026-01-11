import 'package:flutter/material.dart';
import 'package:instagram_clone/features/home/widgets/post_section.dart';
import 'package:instagram_clone/features/home/widgets/stories_head_section.dart';
import '../domain/models/post_model.dart';

class HomeFeedBody extends StatelessWidget {
  const HomeFeedBody({super.key});


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: testPosts.length + 2,
      itemBuilder: (context, index) {
        if (index == 0) return const StoriesHeaderSection();
        if (index == 1) return const Divider(height: 1);
        final post = testPosts[index - 2];
        return DummyPostSection(post: post);
      },
    );
  }
}
