import 'package:crypto_price/src/consts/colors/app_colors.dart';
import 'package:flutter/material.dart';

class NotFoundCard extends StatelessWidget {
  const NotFoundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        CircleAvatar(
          radius: 130,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(
                150,
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.asset("assets/images/nothing.jpg")),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "There is nothing in there",
          style: TextStyle(
            color: AppColors.blueColor,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}
