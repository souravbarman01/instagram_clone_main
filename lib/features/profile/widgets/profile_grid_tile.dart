import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../util/dimensions.dart';

class ProfileGridTile extends StatelessWidget {
  const ProfileGridTile({
    super.key,
    required this.imageUrl,
    this.showVideoBadge = false,
  });

  final String imageUrl;
  final bool showVideoBadge;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        Positioned.fill(
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              color: theme.dividerColor.withValues(alpha: 0.25),
            ),
          ),
        ),
        if (showVideoBadge)
          Positioned(
            top: Dimensions.space6,
            right: Dimensions.space6,
            child: FaIcon(
              FontAwesomeIcons.video,
              size: Dimensions.space14,
              color: Colors.white,
            ),
          ),
      ],
    );
  }
}

