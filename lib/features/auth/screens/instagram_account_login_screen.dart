import 'package:flutter/material.dart';
import 'package:instagram_clone/util/dimensions.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../common/enums/auth_view_enum.dart';
import '../../../common/widgets/bottom_signup_bar.dart';
import '../../../helper/route_helper.dart';
import '../controllers/instagram_auth_controller.dart';
import '../widgets/account_view_widget.dart';
import '../widgets/login_view_form.dart';

class InstagramAuthorizationScreen extends StatefulWidget {
  const InstagramAuthorizationScreen({super.key});

  @override
  State<InstagramAuthorizationScreen> createState() => _InstagramAuthorizationScreenState();
}


class _InstagramAuthorizationScreenState extends State<InstagramAuthorizationScreen> {
  @override
  void dispose() {
    Get.find<InstagramAuthController>().disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InstagramAuthController>(
      builder: (authController) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: Dimensions.space8),

                SizedBox(
                  height: Dimensions.authTopBarHeight,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 180),
                      child: authController.view == AuthView.form
                          ? IconButton(
                              key: const ValueKey('back'),
                              onPressed: authController.toAccount,
                              splashRadius: Dimensions.radiusExtraLarge + 2,
                              icon: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                size: Dimensions.space20,
                              ),
                            )
                          : const SizedBox(key: ValueKey('spacer')),
                    ),
                  ),
                ),
                 SizedBox(height: authController.view == AuthView.form ? Dimensions.paddingSizeLarge * 3 : 0),
                // Main content
                Expanded(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 420),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraLarge),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 220),
                          switchInCurve: Curves.easeOut,
                          switchOutCurve: Curves.easeIn,
                          child: authController.view == AuthView.account
                              ? AccountView(
                                  key: const ValueKey('account'),
                                  username: authController.usernameCtrl.text,
                                  onLogin: () => context.go(RouteHelper.home),
                                  onSwitchAccounts: authController.toForm,
                                )
                              : LoginFormView(
                                  key: const ValueKey('form'),
                                  usernameCtrl: authController.usernameCtrl,
                                  passwordCtrl: authController.passwordCtrl,
                                  onLogin: () => context.go(RouteHelper.home),
                                  onForgotPassword: () {},
                                  onLoginWithFacebook: () {},
                                ),
                        ),
                      ),
                    ),
                  ),
                ),

                const BottomSignupBar(),
                SizedBox(height: Dimensions.paddingSizeSmall),
              ],
            ),
          ),
        );
      },
    );
  }
}
