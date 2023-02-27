import 'package:crypto_price/src/l10n/l10n.dart';
import 'package:flutter/material.dart';

class SaveInvestmentButton extends StatelessWidget {
  final VoidCallback onpress;
  const SaveInvestmentButton({super.key, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade200,
              Colors.blueAccent,
              Colors.blue.shade800,
            ],
            stops: const [
              0.0,
              0.45,
              1.0,
            ],
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            disabledForegroundColor: Colors.transparent.withOpacity(0.38),
            disabledBackgroundColor: Colors.transparent.withOpacity(0.12),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: onpress,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(),
              const Icon(
                Icons.favorite_border,
                size: 36,
                color: Colors.white,
              ),
              Text(
                context.l10n.saveInvestmentButtonTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
