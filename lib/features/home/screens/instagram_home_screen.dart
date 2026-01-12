import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:instagram_clone/util/text.dart';
import '../controllers/home_controller.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/home_feed_widget.dart';
import '../../profile/screens/profile_screen.dart';
import '../widgets/home_app_bar_widget.dart';

class InstagramHomeScreen extends StatelessWidget {
  const InstagramHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) {
        return Scaffold(
          body: IndexedStack(
            index: homeController.currentIndex,
            children: const [
              Scaffold(appBar: HomeAppBar(), body: HomeFeedBody()),
              Scaffold(body: Center(child: Text(AppText.search))),
              Scaffold(body: Center(child: Text(AppText.reels))),
              Scaffold(body: Center(child: Text(AppText.shop))),
              ProfileScreen(),
            ],
          ),
          bottomNavigationBar: InstagramBottomNavBar(
            currentIndex: homeController.currentIndex,
            onTap: homeController.setIndex,
          ),
        );
      },
    );
  }
}
