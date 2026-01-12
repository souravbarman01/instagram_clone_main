import 'package:flutter/material.dart';

import '../../util/images.dart';


class Avatar extends StatelessWidget {
  const Avatar({super.key,required this.size});
  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderColor = theme.dividerColor;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: 0.6),
      ),
      child: ClipOval(
        child: Image.network(
          Images.souravImg,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => Container(
            color: theme.cardColor,
            alignment: Alignment.center,
            child: Icon(Icons.person, size: size * 0.45, color: theme.hintColor),
          ),
        ),
      ),
    );
  }
}