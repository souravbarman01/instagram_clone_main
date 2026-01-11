import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_clone/util/images.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});


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
      leading: IconButton(
        onPressed: () {},
        splashRadius: 22,
        icon: FaIcon(FontAwesomeIcons.camera, color: iconColor, size: 20),
      ),
      title: Image.asset(
        Images.instagramLogoWithName,
        height: 34,
        fit: BoxFit.contain,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          splashRadius: 22,
          icon: FaIcon(FontAwesomeIcons.squarePlus, color: iconColor, size: 20),
        ),
        IconButton(
          onPressed: () {},
          splashRadius: 22,
          icon: FaIcon(FontAwesomeIcons.paperPlane, color: iconColor, size: 20),
        ),
        const SizedBox(width: 4),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Divider(
          height: 1,
          thickness: Theme.of(context).dividerTheme.thickness ?? 0.5,
          color: Theme.of(context).dividerColor,
        ),
      ),
    );
  }
}
