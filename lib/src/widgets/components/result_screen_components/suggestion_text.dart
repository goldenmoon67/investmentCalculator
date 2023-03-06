import 'package:crypto_price/src/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

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
      child: HtmlWidget(
        context.l10n.suggestionText(
          cryptoName,
          cryptoSymbol,
          lastPrice.toStringAsFixed(3),
        ),
        customStylesBuilder: (element) {
          if (element.classes.contains('important')) {
            return {'font-weight': 'bold', 'color': 'blue'};
          }
          return null;
        },
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
      ),
    );
  }
}

/*



HtmlWidget(
        '* You should sell <span class="name">$cryptoName</span> when <span class="name">$cryptoSymbol = \$ ${lastPrice.toStringAsFixed(3)}</span> !',
        customStylesBuilder: (element) {
          if (element.classes.contains('name')) {
            return {'font-weight': 'bold', 'color': 'blue'};
          }
          return null;
        },
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
      ),








RichText(
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


*/