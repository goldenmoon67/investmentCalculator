import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_price/src/consts/colors/app_colors.dart';
import 'package:crypto_price/src/data/models/favorite/favorite_model.dart';
import 'package:crypto_price/src/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class FavoriteCard extends StatefulWidget {
  final FavoriteModel item;
  const FavoriteCard({super.key, required this.item});

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 10),
      child: Container(
        height: 240,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.greyColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 80,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: ClipRRect(
                              child: CachedNetworkImage(
                            imageUrl: widget.item.crypto.icon == " " ||
                                    widget.item.crypto.icon == null
                                ? "assets/images/placeholder_coin.jpg"
                                : widget.item.crypto.icon!,
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) {
                              return SizedBox(
                                height: 80,
                                child: Image.asset(
                                  "assets/images/placeholder_coin.png",
                                  fit: BoxFit.fill,
                                  height: 120,
                                  width: 120,
                                ),
                              );
                            },
                          )),
                        ),
                      ),
                      Text(
                        widget.item.crypto.symbol,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 7,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.item.crypto.name,
                            style: TextStyle(
                              fontSize: 24,
                              color: AppColors.blueColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.sackDollar,
                                color: AppColors.blueColor,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                context.l10n.desiredEarnings,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                widget.item.percentResult != null
                                    ? widget.item.percentResult!.percentWeWant
                                        .toStringAsFixed(1)
                                    : widget.item.priceResult!.expectingProfit
                                        .toStringAsFixed(1),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.blueColor,
                                ),
                              ),
                              Text(
                                widget.item.priceResult != null ? " \$" : " %",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.blueColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.price_change_sharp,
                                color: AppColors.blueColor,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                context.l10n.purchasePrice,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                widget.item.percentResult != null
                                    ? widget.item.percentResult!.currentRange
                                        .toStringAsFixed(3)
                                    : widget.item.priceResult!.currentRange
                                        .toStringAsFixed(3),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.red,
                                ),
                              ),
                              const Text(
                                " \$",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: MediaQuery.of(context).size.width / 10),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColors.blueColor,
                  ),
                  Text(
                    context.l10n.sellingPrice,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    widget.item.percentResult != null
                        ? widget.item.percentResult!.lastPrice
                            .toStringAsFixed(3)
                        : widget.item.priceResult!.lastPrice.toStringAsFixed(3),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.greenColor,
                    ),
                  ),
                  Text(
                    " \$",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.greenColor,
                    ),
                  ),
                  Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: AppColors.blueColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.access_time_filled,
                    color: AppColors.blueColor,
                    size: 16,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    context.l10n.createdTime,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    widget.item.createdTime != null
                        ? DateFormat('dd-MM-yyyy – kk:mm')
                            .format(widget.item.createdTime!)
                        : "",
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
