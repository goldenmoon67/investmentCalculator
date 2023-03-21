import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-5819341208757085/8929643772';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-5819341208757085/3378768340';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
