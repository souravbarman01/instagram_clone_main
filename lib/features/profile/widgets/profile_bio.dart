import 'package:flutter/material.dart';

class ProfileBio extends StatelessWidget {
  const ProfileBio({
    super.key,
    required this.name,
    required this.line1,
    required this.handle,
    required this.line2,
  });

  final String name;
  final String line1;
  final String handle;
  final String line2;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 2),
        RichText(
          text: TextSpan(
            style: theme.textTheme.bodyLarge?.copyWith(height: 1.25),
            children: [
              TextSpan(text: line1),
              TextSpan(
                text: handle,
                style: TextStyle(
                  color: theme.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 2),
        Text(
          line2,
          style: theme.textTheme.bodyLarge?.copyWith(height: 1.25),
        ),
      ],
    );
  }
}
