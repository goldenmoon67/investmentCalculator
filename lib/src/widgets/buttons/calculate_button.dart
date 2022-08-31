import 'package:crypto_price/src/consts/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  final VoidCallback onPress;
  const CalculateButton({Key? key, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(backgroundColor: AppColors.blueButtonColor),
      onPressed: onPress,
      child: SizedBox(
        height: 50,
        child: Center(
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Calculate"),
            ),
          ),
        ),
      ),
    );
  }
}
