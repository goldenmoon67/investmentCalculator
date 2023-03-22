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
    //TODO::it will be added
    if (Platform.isAndroid) {
      return 'ca-app-pub-5819341208757085/5438244454';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-5819341208757085/5491598233';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get saveFavsBannerAdUnitId {
    //TODO::it will be added
    if (Platform.isAndroid) {
      return 'ca-app-pub-5819341208757085/5438244454';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-5819341208757085/5491598233';
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
          // Called when an ad is successfully received.
          onAdLoaded: onAdLoaded,
          // Called when an ad request failed.
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
