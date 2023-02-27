import 'package:crypto_price/src/l10n/l10n.dart';
import 'package:flutter/material.dart';

class BackToCalculateButton extends StatelessWidget {
  const BackToCalculateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        context.l10n.backToCalculateButtonTitle,
        style: const TextStyle(
            color: Colors.blueAccent,
            fontSize: 12,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
