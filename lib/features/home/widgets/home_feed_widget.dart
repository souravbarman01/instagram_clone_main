import 'package:flutter/material.dart';
import 'package:instagram_clone/features/home/widgets/post_section.dart';
import 'package:instagram_clone/features/home/widgets/stories_head_section.dart';

class HomeFeedBody extends StatelessWidget {
  const HomeFeedBody({super.key});


  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const StoriesHeaderSection(),
        const Divider(height: 1),
        DummyPostSection(),
      ],
    );
  }
}