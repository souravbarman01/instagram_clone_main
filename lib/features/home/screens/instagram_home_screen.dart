import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              Scaffold(body: Center(child: Text('Search'))),
              Scaffold(body: Center(child: Text('Reels'))),
              Scaffold(body: Center(child: Text('Shop'))),
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
