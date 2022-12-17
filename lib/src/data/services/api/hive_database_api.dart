import 'package:crypto_price/src/data/models/crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDataBaseApi {
  final Box<Crypto> _favoriteBox = Hive.box<Crypto>("favorites");
  addItem(Crypto crypto) async {
    try {
      if (_favoriteBox.length < 5) {
        _favoriteBox.add(crypto);
        debugPrint("Crypto was saved. Favorite Limit: ${_favoriteBox.length}");
      } else {
        debugPrint("Limit is full");

        return "Limit is full";
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  deleteItem(Crypto crypto) async {
    try {
      if (findItemIndex(crypto) != null) {
        var itemIndex = findItemIndex(crypto);
        _favoriteBox.deleteAt(itemIndex!);
      }
      debugPrint("Favorite was deleted");
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  int? findItemIndex(Crypto crypto) {
    int? itemIndex;
    try {
      for (int i = 0; i < 5; i++) {
        if (crypto == _favoriteBox.getAt(i)) {
          itemIndex = i;
          break;
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return itemIndex;
  }

  getAllItems() async {
    List<Crypto?> favorites = [];
    try {
      for (int i = 0; i < 5; i++) {
        favorites.add(_favoriteBox.getAt(i));
      }
      debugPrint(
          "Favorites list is ready. Favorites length: ${favorites.length}");
    } catch (e) {
      debugPrint(e.toString());
    }
    return favorites;
  }
}
