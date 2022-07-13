import 'package:english_words/english_words.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:startup_namer/main.dart';

class FavoritesState extends ChangeNotifier {
  final _savedFavorites = <WordPair>{};

  void removeFromList(value) {
    _savedFavorites.remove(value);
    notifyListeners();
  }

  void addToList(value) {
    _savedFavorites.add(value);
    notifyListeners();
  }

  List getSavedList() {
    final savedList = _savedFavorites.toList();
    return savedList;
  }

  bool checkSaved(position) {
    final contains = _savedFavorites.contains(position);
    return contains;
  }

  static ChangeNotifierProvider get provider {
    return ChangeNotifierProvider<FavoritesState>(
      create: (_) => FavoritesState(),
      child: const AppWidget(),
    );
  }
}
