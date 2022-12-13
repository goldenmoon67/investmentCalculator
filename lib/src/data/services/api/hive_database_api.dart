import 'package:crypto_price/src/data/models/crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDataBaseApi {
  Box<Crypto> favoriteBox = Hive.box<Crypto>("favorites");
  addItem(Crypto crypto) async {
    try {
      if (favoriteBox.length < 5) {
        favoriteBox.add(crypto);
        return "Added";
      } else {
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
        favoriteBox.deleteAt(itemIndex!);
      }
      return "Deleted";
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  int? findItemIndex(Crypto crypto) {
    int? itemIndex;
    try {
      for (int i = 0; i < 5; i++) {
        if (crypto == favoriteBox.getAt(i)) {
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
        favorites.add(favoriteBox.getAt(i));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return favorites;
  }
}
