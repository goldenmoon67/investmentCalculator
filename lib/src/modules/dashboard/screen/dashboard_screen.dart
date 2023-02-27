import 'package:auto_route/auto_route.dart';
import 'package:crypto_price/src/l10n/l10n.dart';
import 'package:crypto_price/src/utils/navigation/router.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      lazyLoad: true,
      inheritNavigatorObservers: false,
      routes: const [HomeRoute(), FavoriteRoute()],
      duration: const Duration(milliseconds: 200),
      builder: (context, child, animation) {
        final tabsRouter = context.tabsRouter;
        return Scaffold(
          body: FadeTransition(
            alwaysIncludeSemantics: true,
            opacity: animation,
            child: child,
          ),
          bottomNavigationBar: buildBottomNavigationBar(context, tabsRouter),
        );
      },
    );
  }
}

BottomNavigationBar buildBottomNavigationBar(
    BuildContext context, TabsRouter tabsRouter) {
  return BottomNavigationBar(
    elevation: 0,
    enableFeedback: false,
    type: BottomNavigationBarType.fixed,
    onTap: tabsRouter.setActiveIndex,
    currentIndex: tabsRouter.activeIndex,
    items: [
      BottomNavigationBarItem(
        icon: const Icon(Icons.calculate),
        label: context.l10n.bottombarItemHome,
      ),
      BottomNavigationBarItem(
        icon: const Icon(
          Icons.wallet,
        ),
        label: context.l10n.bottombarItemWallet,
      ),
    ],
  );
}
