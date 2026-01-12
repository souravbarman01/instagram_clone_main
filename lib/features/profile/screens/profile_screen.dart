import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_main/util/dimensions.dart';
import 'package:instagram_clone_main/util/text.dart';

import '../widgets/edit_profile_button.dart';
import '../widgets/highlights_row.dart';
import '../widgets/profile_app_bar.dart';
import '../widgets/profile_bio.dart';
import '../widgets/profile_grid_tile.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_tabs.dart';
import '../controllers/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (profileController) {
        final theme = Theme.of(context);
        final profile = profileController.profile;

        return Scaffold(
          appBar: ProfileAppBar(username: profile.username),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileHeader(
                        avatarUrl: profile.avatarUrl,
                        posts: profile.posts,
                        followers: profile.followers,
                        following: profile.following,
                      ),
                      const SizedBox(height: Dimensions.space12),
                      ProfileBio(
                        name: profile.displayName,
                        line1: profile.bioLine1,
                        handle: profile.bioHandle,
                        line2: profile.bioLine2,
                      ),
                      const SizedBox(height: Dimensions.space12),
                      const EditProfileButton(),
                      const SizedBox(height: Dimensions.space14),
                      HighlightsRow(
                        highlights: profile.highlights,
                        onTap: () {},
                      ),
                      const SizedBox(height: Dimensions.space10),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Divider(height: Dimensions.dividerHeight, color: theme.dividerColor),
                    ProfileTabs(
                      tabIndex: profileController.tabIndex,
                      onChanged: profileController.setTabIndex,
                    ),
                    Divider(height: Dimensions.dividerHeight, color: theme.dividerColor),
                  ],
                ),
              ),
              if (profileController.tabIndex == 0)
                SliverPadding(
                  padding: EdgeInsets.zero,
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final url = profile.gridImages[index % profile.gridImages.length];
                        final isVideo = index == 4;
                        return ProfileGridTile(
                          imageUrl: url,
                          showVideoBadge: isVideo,
                        );
                      },
                      childCount: profile.gridImages.length,
                    ),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1,
                    ),
                  ),
                )
              else
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Text(
                      AppText.taggedPhotos,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.hintColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
