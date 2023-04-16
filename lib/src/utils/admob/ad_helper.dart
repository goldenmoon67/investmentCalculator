import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  static String get homeScreenBannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-5819341208757085/8929643772';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-5819341208757085/3378768340';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get favScreenBannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-5819341208757085/5438244454';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-5819341208757085/5491598233';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get favScreenXLBannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-5819341208757085/8167337812';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-5819341208757085/4398912370';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get saveFavsBannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-5819341208757085/3238444764';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-5819341208757085/9790839850';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static createBannerAd(String bannerId) {
    return BannerAd(
      adUnitId: bannerId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {},
        onAdFailedToLoad: (ad, err) {
          debugPrint('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    )..load();
  }

  static createBannerAdXL(String bannerId) {
    return BannerAd(
      adUnitId: bannerId,
      request: const AdRequest(),
      size: AdSize.mediumRectangle,
      listener: BannerAdListener(
        onAdLoaded: (ad) {},
        onAdFailedToLoad: (ad, err) {
          debugPrint('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    )..load();
  }

  static createInterstitialAd(
      String adUnitId, void Function(InterstitialAd) onAdLoaded) {
    InterstitialAd.load(
        adUnitId: adUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: onAdLoaded,
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('InterstitialAd failed to load: $error');
          },
        ));
  }

  static getBannerAdWidget(BannerAd? bannerAd) {
    if (bannerAd != null) {
      return Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: bannerAd.size.width.toDouble(),
          height: bannerAd.size.height.toDouble(),
          child: AdWidget(ad: bannerAd),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
