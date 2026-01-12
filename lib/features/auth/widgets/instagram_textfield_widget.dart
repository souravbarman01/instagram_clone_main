import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_main/common/controllers/theme_controller.dart';

class IGTextField extends StatelessWidget {
  const IGTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.textInputAction,
  });

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        final theme = Theme.of(context);
        final isDark = themeController.isDarkMode;
        final fill = isDark ? const Color(0xFF121212) : const Color(0xFFF6F6F6);
        final border = isDark ? const Color(0xFF2F2F2F) : const Color(0xFFDBDBDB);

        return TextField(
          controller: controller,
          obscureText: obscureText,
          textInputAction: textInputAction,
          style: theme.textTheme.bodyLarge?.copyWith(fontSize: 15),
          decoration: InputDecoration(
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            hintText: hintText,
            hintStyle: TextStyle(color: theme.hintColor, fontSize: 14),
            filled: true,
            fillColor: fill,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: border, width: 0.8),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: border, width: 0.8),
            ),
          ),
        );
      },
    );
  }
}
