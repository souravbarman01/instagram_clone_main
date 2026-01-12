import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_clone_main/util/dimensions.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key, required this.username});

  final String username;

  @override
  Size get preferredSize => const Size.fromHeight(Dimensions.appBarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconColor = theme.textTheme.bodyLarge?.color;

    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: theme.scaffoldBackgroundColor,
      surfaceTintColor: theme.scaffoldBackgroundColor,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(FontAwesomeIcons.lock, size: Dimensions.space14, color: iconColor),
          const SizedBox(width: Dimensions.space8),
          Text(
            username,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: Dimensions.space4),
          Icon(Icons.keyboard_arrow_down_rounded, color: iconColor),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          splashRadius: Dimensions.radiusExtraLarge + 2,
          icon: FaIcon(FontAwesomeIcons.bars, size: Dimensions.space18, color: iconColor),
        ),
        const SizedBox(width: Dimensions.space4),
      ],
    );
  }
}
