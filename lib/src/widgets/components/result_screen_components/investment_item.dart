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
    debugPrint(imageUrl);
    return ListTile(
      leading: AspectRatio(
        aspectRatio: 1,
        child: ClipRRect(
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) {
              return const Center(
                child: Icon(
                  Icons.dangerous,
                  color: Colors.black,
                ),
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
            width: 48,
          ),
          Text(
            "\$ ${currentRange.toStringAsFixed(3)}",
          ),
        ],
      ),
    );
  }
}
