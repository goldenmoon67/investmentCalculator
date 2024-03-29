import 'package:crypto_price/src/consts/colors/app_colors.dart';
import 'package:crypto_price/src/l10n/l10n.dart';
import 'package:flutter/material.dart';

class TabbarWidget extends StatefulWidget {
  final TabController tabController;
  const TabbarWidget({Key? key, required this.tabController}) : super(key: key);

  @override
  State<TabbarWidget> createState() => _TabbarWidgetState();
}

class _TabbarWidgetState extends State<TabbarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.greyColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.5),
        child: TabBar(
          automaticIndicatorColorAdjustment: false,
          isScrollable: false,
          indicatorColor: Colors.white,
          indicator: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          controller: widget.tabController,
          tabs: [
            Tab(
              child: Tab(
                child: Text(
                  context.l10n.tabbarTitle1,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Tab(
              icon: Text(
                context.l10n.tabbarTitle2,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
