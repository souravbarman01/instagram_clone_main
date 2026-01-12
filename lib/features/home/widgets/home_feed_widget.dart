import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_main/features/home/widgets/post_section.dart';
import 'package:instagram_clone_main/features/home/widgets/stories_head_section.dart';
import 'package:instagram_clone_main/util/dimensions.dart';
import '../controllers/home_controller.dart';

class HomeFeedBody extends StatelessWidget {
  const HomeFeedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) {
        if (homeController.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (homeController.errorMessage != null) {
          return Center(child: Text(homeController.errorMessage!));
        }

        final posts = homeController.posts;
        if (posts.isEmpty) {
          return const Center(child: Text('No posts available'));
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: posts.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) return const StoriesHeaderSection();
            if (index == 1) {
              return const Divider(height: Dimensions.dividerHeight);
            }
            final post = posts[index - 2];
            return PostSection(post: post);
          },
        );
      },
    );
  }
}
