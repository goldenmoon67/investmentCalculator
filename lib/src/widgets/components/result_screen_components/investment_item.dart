import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

enum InvestmentItemType {
  percent,
  price,
}

class InvestmentItem extends StatelessWidget {
  final String cryptoSymbol;
  final String cryptoName;
  final double howMuch;
  final double currentRange;
  final String imageUrl;
  final InvestmentItemType investmentItemType;
  const InvestmentItem({
    super.key,
    required this.cryptoSymbol,
    required this.cryptoName,
    required this.howMuch,
    required this.currentRange,
    required this.investmentItemType,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    String? formattedValue;
    if (currentRange < 0.01) {
      formattedValue = currentRange.toStringAsFixed(9);
    } else if (currentRange < 100) {
      formattedValue = currentRange.toStringAsFixed(3);
    } else {
      formattedValue = currentRange.toStringAsFixed(0);
    }
    return ListTile(
      leading: AspectRatio(
        aspectRatio: 1,
        child: ClipRRect(
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) {
              return Center(
                child: Image.asset("assets/images/placeholder_coin.png"),
              );
            },
          ),
        ),
      ),
      title: Text(
        cryptoSymbol,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: Text(
        cryptoName,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          investmentItemType == InvestmentItemType.price
              ? Text(
                  " ${howMuch.toStringAsFixed(3)}",
                )
              : const SizedBox(),
          const SizedBox(
            width: 10,
          ),
          Text(
            "\$ $formattedValue",
          ),
        ],
      ),
    );
  }
}
