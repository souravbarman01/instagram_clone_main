import 'package:flutter/widgets.dart';

class Dimensions {
  static double fontSizeExtraSmall(BuildContext context) => _isWide(context) ? 12 : 10;
  static double fontSizeSmall(BuildContext context) => _isWide(context) ? 14 : 12;
  static double fontSizeDefault(BuildContext context) => _isWide(context) ? 16 : 14;
  static double fontSizeLarge(BuildContext context) => _isWide(context) ? 18 : 16;
  static double fontSizeExtraLarge(BuildContext context) => _isWide(context) ? 20 : 18;
  static double fontSizeOverLarge(BuildContext context) => _isWide(context) ? 26 : 24;

  static bool _isWide(BuildContext context) => MediaQuery.sizeOf(context).width >= 1300;

  static const double dividerHeight = 1.0;

  static const double space2 = 2.0;
  static const double space4 = 4.0;
  static const double space6 = 6.0;
  static const double space8 = 8.0;
  static const double space10 = 10.0;
  static const double space12 = 12.0;
  static const double space14 = 14.0;
  static const double space16 = 16.0;
  static const double space18 = 18.0;
  static const double space20 = 20.0;
  static const double space28 = 28.0;

  static const double appBarHeight = 56.0;
  static const double bottomNavBarHeight = 56.0;
  static const double authTopBarHeight = 44.0;
  static const double primaryButtonHeight = 44.0;
  static const double profileEditButtonHeight = 36.0;
  static const double profileTabHeight = 48.0;

  static const double storyHeaderHeight = 115.0;
  static const double highlightRowHeight = 108.0;
  static const double storyBubbleWidth = 78.0;
  static const double storyRingSize = 64.0;
  static const double storyBadgeSize = 20.0;

  static const double profileAvatarSize = 92.0;
  static const double profileNavIconSize = 30.0;

  static const double splashLogoSize = 96.0;
  static const double homeAppBarLogoHeight = 34.0;

  static const double paddingSizeExtraSmall = 5.0;
  static const double paddingSizeSmall = 10.0;
  static const double paddingSizeDefault = 15.0;
  static const double paddingSizeLarge = 20.0;
  static const double paddingSizeExtraLarge = 25.0;
  static const double paddingSizeOverLarge = 30.0;
  static const double paddingSizeExtraOverLarge = 35.0;

  static const double radiusSmall = 5.0;
  static const double radiusDefault = 10.0;
  static const double radiusLarge = 15.0;
  static const double radiusExtraLarge = 20.0;

  static const double webMaxWidth = 1170;
  static const int messageInputLength = 250;
}
