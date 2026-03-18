import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/recipe.dart';

class FavoritesProvider extends ChangeNotifier {
  static const String _favoritesKey = 'favorites';
  Set<String> _favoriteIds = {};
  SharedPreferences? _prefs;

  FavoritesProvider() {
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    _prefs = await SharedPreferences.getInstance();
    final saved = _prefs?.getStringList(_favoritesKey) ?? [];
    _favoriteIds = saved.toSet();
    notifyListeners();
  }

  Future<void> _saveFavorites() async {
    await _prefs?.setStringList(_favoritesKey, _favoriteIds.toList());
  }

  bool isFavorite(String recipeId) {
    return _favoriteIds.contains(recipeId);
  }

  Future<void> toggleFavorite(String recipeId) async {
    if (_favoriteIds.contains(recipeId)) {
      _favoriteIds.remove(recipeId);
    } else {
      _favoriteIds.add(recipeId);
    }
    notifyListeners();
    await _saveFavorites();
  }

  List<Recipe> getFavoriteRecipes(List<Recipe> allRecipes) {
    return allRecipes.where((r) => _favoriteIds.contains(r.id)).toList();
  }
}