import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key, required this.username});

  final String username;

  @override
  Size get preferredSize => const Size.fromHeight(56);

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
          FaIcon(FontAwesomeIcons.lock, size: 14, color: iconColor),
          const SizedBox(width: 8),
          Text(
            username,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 4),
          Icon(Icons.keyboard_arrow_down_rounded, color: iconColor),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          splashRadius: 22,
          icon: FaIcon(FontAwesomeIcons.bars, size: 18, color: iconColor),
        ),
        const SizedBox(width: 4),
      ],
    );
  }
}
