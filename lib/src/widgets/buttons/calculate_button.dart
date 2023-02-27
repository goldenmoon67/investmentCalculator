import 'package:crypto_price/src/consts/colors/app_colors.dart';
import 'package:crypto_price/src/l10n/l10n.dart';
import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  final VoidCallback onPress;
  const CalculateButton({Key? key, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(4, 8),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ButtonStyle(backgroundColor: AppColors.blueButtonColor),
        onPressed: onPress,
        child: SizedBox(
          height: 50,
          child: Center(
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(context.l10n.calculateButtonTitle),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
