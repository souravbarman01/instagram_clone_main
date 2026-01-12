import 'package:flutter/material.dart';
import 'package:instagram_clone_main/util/dimensions.dart';
import 'package:instagram_clone_main/util/text.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final line = theme.brightness == Brightness.dark ? const Color(0xFF2F2F2F) : const Color(0xFFDBDBDB);

    return Row(
      children: [
        Expanded(child: Container(height: Dimensions.dividerHeight, color: line)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.space14),
          child: Text(
            AppText.or,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.hintColor,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.3,
            ),
          ),
        ),
        Expanded(child: Container(height: Dimensions.dividerHeight, color: line)),
      ],
    );
  }
}
