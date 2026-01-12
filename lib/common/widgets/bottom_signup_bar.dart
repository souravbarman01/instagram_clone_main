import 'package:flutter/material.dart';
import 'package:instagram_clone_main/util/dimensions.dart';
import 'package:instagram_clone_main/util/text.dart';

class BottomSignupBar extends StatelessWidget {
  const BottomSignupBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(
          height: Dimensions.dividerHeight,
          thickness: theme.dividerTheme.thickness ?? 0.5,
          color: theme.dividerColor,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppText.noAccountPrefix,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.hintColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  AppText.signUp,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: theme.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: Dimensions.space6),
      ],
    );
  }
}
