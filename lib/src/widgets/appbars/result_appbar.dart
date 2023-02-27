import 'package:crypto_price/src/consts/colors/app_colors.dart';
import 'package:crypto_price/src/l10n/l10n.dart';
import 'package:flutter/material.dart';

class ResultAppBar extends StatefulWidget implements PreferredSizeWidget {
  const ResultAppBar({super.key});

  @override
  State<ResultAppBar> createState() => _ResultAppBarState();

  @override
  Size get preferredSize {
    return const Size.fromHeight(56);
  }
}

class _ResultAppBarState extends State<ResultAppBar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 32),
      child: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          color: AppColors.blueColor,
        ),
        backgroundColor: AppColors.greyColor,
        elevation: 0,
        title: Text(
          context.l10n.resultScreenAppBarTitle,
          style: TextStyle(
            color: AppColors.blueColor,
            fontSize: 32,
          ),
        ),
      ),
    );
  }
}
