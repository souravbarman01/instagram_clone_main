import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_clone/util/dimensions.dart';

import '../domain/models/demo_avatars.dart';

class InstagramBottomNavBar extends StatelessWidget {
  const InstagramBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.activeColor,
    this.inactiveColor,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;
  final Color? activeColor;
  final Color? inactiveColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final active = activeColor ?? theme.textTheme.bodyLarge?.color ?? Colors.black;
    final inactive = inactiveColor ?? theme.hintColor;
    final dividerThickness = theme.dividerTheme.thickness ?? 0.5;

    return SafeArea(
      top: false,
      child: Container(
        height: Dimensions.bottomNavBarHeight,
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          border: Border(
            top: BorderSide(color: theme.dividerColor, width: dividerThickness),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavIconButton(
              index: 0,
              currentIndex: currentIndex,
              onTap: onTap,
              activeColor: active,
              inactiveColor: inactive,
              activeIcon: FontAwesomeIcons.house,
              inactiveIcon: FontAwesomeIcons.house,
            ),
            _NavIconButton(
              index: 1,
              currentIndex: currentIndex,
              onTap: onTap,
              activeColor: active,
              inactiveColor: inactive,
              activeIcon: FontAwesomeIcons.magnifyingGlass,
              inactiveIcon: FontAwesomeIcons.magnifyingGlass,
            ),
            _NavIconButton(
              index: 2,
              currentIndex: currentIndex,
              onTap: onTap,
              activeColor: active,
              inactiveColor: inactive,
              activeIcon: FontAwesomeIcons.clapperboard,
              inactiveIcon: FontAwesomeIcons.clapperboard,
            ),
            _NavIconButton(
              index: 3,
              currentIndex: currentIndex,
              onTap: onTap,
              activeColor: active,
              inactiveColor: inactive,
              activeIcon: FontAwesomeIcons.bagShopping,
              inactiveIcon: FontAwesomeIcons.bagShopping,
            ),
            _ProfileNavIcon(
              index: 4,
              currentIndex: currentIndex,
              onTap: onTap,
              activeColor: active,
              inactiveColor: inactive,
            ),
          ],
        ),
      ),
    );
  }
}

class _NavIconButton extends StatelessWidget {
  const _NavIconButton({
    required this.index,
    required this.currentIndex,
    required this.onTap,
    required this.activeColor,
    required this.inactiveColor,
    required this.activeIcon,
    required this.inactiveIcon,
  });

  final int index;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final Color activeColor;
  final Color inactiveColor;
  final IconData activeIcon;
  final IconData inactiveIcon;

  @override
  Widget build(BuildContext context) {
    final isActive = index == currentIndex;
    return IconButton(
      onPressed: () => onTap(index),
      splashRadius: 22,
      iconSize: 28,
      icon: FaIcon(
        isActive ? activeIcon : inactiveIcon,
        color: isActive ? activeColor : inactiveColor,
        size: 22,
      ),
    );
  }
}

class _ProfileNavIcon extends StatelessWidget {
  const _ProfileNavIcon({
    required this.index,
    required this.currentIndex,
    required this.onTap,
    required this.activeColor,
    required this.inactiveColor,
  });

  final int index;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isActive = index == currentIndex;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        width: Dimensions.profileNavIconSize,
        height: Dimensions.profileNavIconSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isActive ? activeColor : Colors.transparent,
            width: 1.6,
          ),
        ),
        child: ClipOval(
          child: Image.network(
            demoAvatar3,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              color: theme.cardColor,
              alignment: Alignment.center,
              child: Icon(Icons.person, color: theme.hintColor, size: 18),
            ),
          ),
        ),
      ),
    );
  }
}
