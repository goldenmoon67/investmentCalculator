import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:crypto_price/src/consts/colors/app_colors.dart';
import 'package:crypto_price/src/l10n/l10n.dart';
import 'package:flutter/material.dart';

class ProAppFeatures extends StatelessWidget {
  const ProAppFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    var colorizeColors = [
      Colors.red.shade100,
      Colors.red,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 35.0,
      fontFamily: 'Horizon',
    );
    return RepaintBoundary(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(3),
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.blueColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 35,
                            width: 100,
                            child: DefaultTextStyle(
                              style: const TextStyle(
                                fontSize: 35.0,
                                fontWeight: FontWeight.bold,
                              ),
                              child: AnimatedTextKit(
                                repeatForever: true,
                                animatedTexts: [
                                  ColorizeAnimatedText(
                                    context.l10n.very,
                                    textStyle: colorizeTextStyle,
                                    colors: colorizeColors,
                                  ),
                                  ColorizeAnimatedText(
                                    context.l10n.very,
                                    textStyle: colorizeTextStyle,
                                    colors: colorizeColors,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 35,
                            child: DefaultTextStyle(
                              style: const TextStyle(
                                fontSize: 35.0,
                                fontFamily: 'Canterbury',
                                fontWeight: FontWeight.bold,
                              ),
                              child: AnimatedTextKit(
                                repeatForever: true,
                                animatedTexts: [
                                  ColorizeAnimatedText(
                                    context.l10n.soon,
                                    textStyle: colorizeTextStyle,
                                    colors: colorizeColors,
                                  ),
                                  ColorizeAnimatedText(
                                    context.l10n.soon,
                                    textStyle: colorizeTextStyle,
                                    colors: colorizeColors,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        height: 120,
                        child: Image.asset(
                          "assets/images/logo_reverse.png",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: [
                    _buildFeatureItem(
                      icon: Icons.camera_alt,
                      title: context.l10n.proAppFeatureRealDataTitle,
                      description: context.l10n.proAppFeatureRealDataDesc,
                      isDarkCard: false,
                      imagePath: "assets/images/cmc.png",
                    ),
                    const SizedBox(height: 8),
                    _buildFeatureItem(
                      icon: Icons.notifications_active,
                      title: context.l10n.proAppFeatureRealNotiTitle,
                      description: context.l10n.proAppFeatureRealNotiDesc,
                      isDarkCard: true,
                      imagePath: "assets/images/noti.png",
                    ),
                    const SizedBox(height: 8),
                    _buildFeatureItem(
                      icon: Icons.calendar_today,
                      title: context.l10n.proAppFeatureWalletTitle,
                      description: context.l10n.proAppFeatureWalletDesc,
                      isDarkCard: false,
                      imagePath: "assets/images/wallet.png",
                    ),
                    const SizedBox(height: 8),
                    _buildFeatureItem(
                      icon: Icons.calendar_today,
                      title: context.l10n.proAppFeatureFunctionsTitle,
                      description: context.l10n.proAppFeatureFunctionsDesc,
                      isDarkCard: false,
                      imagePath: "assets/images/calc.png",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      child: Text(
                        context.l10n.ok,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem({
    required IconData icon,
    required String title,
    required String description,
    required bool isDarkCard,
    required String imagePath,
  }) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isDarkCard
              ? [const Color(0xFF1F1F1F), const Color(0xFF262626)]
              : [const Color(0xFF176DE1), const Color(0xFF0D47A1)],
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 180,
            child: Image.asset(imagePath, fit: BoxFit.fill),
          ),
          ListTile(
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              description,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
