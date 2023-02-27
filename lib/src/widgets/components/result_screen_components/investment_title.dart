import 'package:crypto_price/src/l10n/l10n.dart';
import 'package:crypto_price/src/widgets/components/result_screen_components/investment_item.dart';
import 'package:flutter/material.dart';

class InvestmentTitle extends StatelessWidget {
  final InvestmentItemType investmentItemType;
  const InvestmentTitle({super.key, required this.investmentItemType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(context.l10n.investmentItemColumnTitle1),
          const SizedBox(
            width: 58,
          ),
          investmentItemType == InvestmentItemType.price
              ? Text(context.l10n.investmentItemColumnTitle2)
              : const SizedBox(),
          Text(context.l10n.investmentItemColumnTitle3),
        ],
      ),
    );
  }
}
