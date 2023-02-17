import 'package:crypto_price/src/widgets/text/gradient_text.dart';
import 'package:flutter/material.dart';

class SuggestionItem extends StatelessWidget {
  final String cryptoName;
  final double lastPrice;
  const SuggestionItem(
      {super.key, required this.cryptoName, required this.lastPrice});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/result.jpg",
        ),
        Align(
          alignment: Alignment.topRight,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 2 / 3,
                margin: const EdgeInsets.only(top: 25, right: 12),
                child: Container(
                  decoration: BoxDecoration(
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
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueAccent.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 18,
                      ),
                      child: Row(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GradientText(
                                "$cryptoName = ",
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
                              GradientText(
                                "\$ ${lastPrice.toStringAsFixed(3)}",
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GradientText(
                    "Price To Sell",
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
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
