import 'package:crypto_price/src/consts/colors/app_colors.dart';
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
        backgroundColor: AppColors.greyColor,
        elevation: 0,
        title: const Text(
          "Your Investment",
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 32,
          ),
        ),
      ),
    );
  }
}
