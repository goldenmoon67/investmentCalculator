import 'package:crypto_price/src/widgets/text/gradient_text.dart';
import 'package:flutter/material.dart';

enum ProfitType {
  percent,
  price,
}

class ProfitItem extends StatelessWidget {
  final double expectingProfit;
  final ProfitType profitType;
  const ProfitItem(
      {super.key, required this.expectingProfit, required this.profitType});

  @override
  Widget build(BuildContext context) {
    String prefix = profitType == ProfitType.percent ? "%" : "\$";
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            GradientText(
              "Profit You Want: ",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              gradient: LinearGradient(
                colors: [
                  Colors.blue.shade200,
                  Colors.blueAccent,
                  Colors.blue.shade900,
                ],
                stops: const [
                  0.0,
                  0.2,
                  1.0,
                ],
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            GradientText(
              "$prefix $expectingProfit",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              gradient: LinearGradient(
                colors: [
                  Colors.blue.shade200,
                  Colors.blueAccent,
                  Colors.blue.shade900,
                ],
                stops: const [
                  0.0,
                  0.2,
                  1.0,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
