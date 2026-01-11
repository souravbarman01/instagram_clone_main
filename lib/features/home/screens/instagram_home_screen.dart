import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/home_app_bar_widget.dart';
import '../widgets/home_feed_widget.dart';

class InstagramHomeScreen extends StatelessWidget {
  const InstagramHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) {
        return Scaffold(
          appBar: const HomeAppBar(),
          body: IndexedStack(
            index: homeController.currentIndex,
            children: const [
              HomeFeedBody(),
              Center(child: Text('Search')),
              Center(child: Text('Reels')),
              Center(child: Text('Shop')),
              Center(child: Text('Profile')),
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
