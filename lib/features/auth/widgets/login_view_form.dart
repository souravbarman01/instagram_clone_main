import 'package:flutter/material.dart';
import '../../../common/widgets/primary_login_button.dart';
import '../../../util/dimensions.dart';
import '../../../util/images.dart';
import 'instagram_textfield_widget.dart';
import 'or_divider_widget.dart';

class LoginFormView extends StatelessWidget {
  const LoginFormView({
    super.key,
    required this.usernameCtrl,
    required this.passwordCtrl,
    required this.onLogin,
    required this.onForgotPassword,
    required this.onLoginWithFacebook,
  });

  final TextEditingController usernameCtrl;
  final TextEditingController passwordCtrl;
  final VoidCallback onLogin;
  final VoidCallback onForgotPassword;
  final VoidCallback onLoginWithFacebook;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.primaryColor;

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 18),

                Image.asset(
                  Images.instagramLogoWithName,
                  height: Dimensions.paddingSizeExtraOverLarge * 2.2,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 28),

                IGTextField(
                  controller: usernameCtrl,
                  hintText: 'Phone number, username, or email',
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 12),
                IGTextField(
                  controller: passwordCtrl,
                  hintText: 'Password',
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                ),

                const SizedBox(height: 10),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: onForgotPassword,
                    style: TextButton.styleFrom(
                      foregroundColor: primary,
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                    ),
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                PrimaryLoginButton(
                  text: 'Log in',
                  onPressed: onLogin,
                ),

                const SizedBox(height: 18),

                TextButton.icon(
                  onPressed: onLoginWithFacebook,
                  icon: Icon(Icons.facebook, color: primary, size: Dimensions.paddingSizeDefault * 1.5),
                  label: Text(
                    'Log in with Facebook',
                    style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                const OrDivider(),

                const SizedBox(height: 18),

                const SizedBox(height: 28),
              ],
            ),
          ),
        );
      },
    );
  }
}
