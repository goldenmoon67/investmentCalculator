import 'package:auto_route/auto_route.dart';
import 'package:crypto_price/src/utils/navigation/router.gr.dart';
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
      homeIndex: 1,
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
    onTap: ((value) {
      if (value == 0) {}

      //TODO:: BLoc provider (multi) refresh for all click
      tabsRouter.setActiveIndex(value);
    }),
    currentIndex: tabsRouter.activeIndex,
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Calculate'),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.fiber_smart_record,
          ),
          label: 'Record'),
    ],
  );
}
