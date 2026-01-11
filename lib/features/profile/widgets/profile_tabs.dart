import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileTabs extends StatelessWidget {
  const ProfileTabs({super.key, required this.tabIndex, required this.onChanged});

  final int tabIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final active = theme.textTheme.bodyLarge?.color;
    final inactive = theme.hintColor;

    return SizedBox(
      height: 48,
      child: Row(
        children: [
          Expanded(
            child: _TabButton(
              icon: FontAwesomeIcons.tableCells,
              isActive: tabIndex == 0,
              activeColor: active,
              inactiveColor: inactive,
              onTap: () => onChanged(0),
            ),
          ),
          Expanded(
            child: _TabButton(
              icon: FontAwesomeIcons.userTag,
              isActive: tabIndex == 1,
              activeColor: active,
              inactiveColor: inactive,
              onTap: () => onChanged(1),
            ),
          ),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  const _TabButton({
    required this.icon,
    required this.isActive,
    required this.activeColor,
    required this.inactiveColor,
    required this.onTap,
  });

  final IconData icon;
  final bool isActive;
  final Color? activeColor;
  final Color? inactiveColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      child: Container(
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isActive ? (activeColor ?? theme.primaryColor) : Colors.transparent,
              width: 1.6,
            ),
          ),
        ),
        child: FaIcon(
          icon,
          size: 18,
          color: isActive ? activeColor : inactiveColor,
        ),
      ),
    );
  }
}

