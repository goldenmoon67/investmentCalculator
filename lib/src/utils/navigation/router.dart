import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class AppRouter {
  static pushScreeen(BuildContext context, Widget screen) => pushNewScreen(
        context,
        screen: screen,
        withNavBar: true, // OPTIONAL VALUE. True by default.
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
}
