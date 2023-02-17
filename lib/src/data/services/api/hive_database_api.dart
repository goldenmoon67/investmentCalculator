import 'package:crypto_price/src/data/models/favorite/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDataBaseApi {
  final Box<FavoriteModel> _favoriteBox = Hive.box<FavoriteModel>("favs");
  addItem(FavoriteModel favoriteModel) async {
    try {
      if (_favoriteBox.length < 5) {
        _favoriteBox.add(favoriteModel);
        debugPrint(
            "${favoriteModel.crypto.name} was saved. Favorite Limit: ${_favoriteBox.length}");
      } else {
        debugPrint("Limit is full");

        return "Limit is full";
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  deleteItem(FavoriteModel favoriteModel) async {
    try {
      if (findItemIndex(favoriteModel) != null) {
        var itemIndex = findItemIndex(favoriteModel);
        _favoriteBox.deleteAt(itemIndex!);

        debugPrint(
            "Favorite was deleted. Favorite Length: ${_favoriteBox.length}");
      }
    } catch (e) {
      debugPrint("----ERROR------");

      debugPrint(e.toString());
    }
  }

  int? findItemIndex(FavoriteModel favoriteModel) {
    int? itemIndex;
    try {
      for (int i = 0; i < 5; i++) {
        if (favoriteModel == _favoriteBox.getAt(i)) {
          itemIndex = i;
          break;
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return itemIndex;
  }

  getAllItems() {
    List<FavoriteModel?> favorites = [];
    try {
      if (_favoriteBox.isNotEmpty) {
        for (int i = 0; i < _favoriteBox.length; i++) {
          favorites.add(_favoriteBox.getAt(i));
        }
      }
    } catch (e) {
      debugPrint(e.toString() + "from hive api");
    }
    debugPrint(
        "Favorites list is ready. Favorites length: ${favorites.length}");
    return favorites;
  }
}
