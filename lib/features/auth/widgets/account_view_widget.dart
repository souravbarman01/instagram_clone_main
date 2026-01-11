import 'package:flutter/material.dart';

import '../../../common/widgets/avatar_widget.dart';
import '../../../common/widgets/primary_login_button.dart';
import '../../../util/dimensions.dart';
import '../../../util/images.dart';

class AccountView extends StatelessWidget {
  const AccountView({
    super.key,
    required this.username,
    required this.onLogin,
    required this.onSwitchAccounts,
  });

  final String username;
  final VoidCallback onLogin;
  final VoidCallback onSwitchAccounts;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.primaryColor;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 20),

        Image.asset(
          Images.instagramLogoWithName,
          height: Dimensions.paddingSizeExtraOverLarge * 2.2,
          fit: BoxFit.contain,
        ),

        const SizedBox(height: 20),

        Avatar(size: 78,),
        const SizedBox(height: 12),

        Text(
          username,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 18),

        PrimaryLoginButton(
          text: 'Log in',
          onPressed: onLogin,
        ),

        const SizedBox(height: 18),

        TextButton(
          onPressed: onSwitchAccounts,
          style: TextButton.styleFrom(
            foregroundColor: primary,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          ),
          child: const Text(
            'Switch accounts',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ),

        const SizedBox(height: 12),
      ],
    );
  }
}