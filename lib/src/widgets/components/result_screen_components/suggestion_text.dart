import 'package:flutter/material.dart';

class SuggestionText extends StatelessWidget {
  final String cryptoName;
  final String cryptoSymbol;
  final double lastPrice;
  const SuggestionText(
      {super.key,
      required this.cryptoName,
      required this.cryptoSymbol,
      required this.lastPrice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 14.0,
            color: Colors.grey,
          ),
          children: <TextSpan>[
            const TextSpan(
                text:
                    "* You should sell "), //TODO::this will be added as a app_en.arb
            TextSpan(
              text: cryptoName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const TextSpan(text: " when "),
            TextSpan(
              text: "$cryptoSymbol = \$ ${lastPrice.toStringAsFixed(3)}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
