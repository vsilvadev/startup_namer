import 'package:english_words/english_words.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:startup_namer/main.dart';

class WordPairState extends ChangeNotifier {
  final _saved = <WordPair>{};

  void removeFromList(value) {
    _saved.remove(value);
    notifyListeners();
  }

  void addToList(value) {
    _saved.add(value);
    notifyListeners();
  }

  List getSavedList() {
    final savedList = _saved.toList();
    return savedList;
  }

  bool checkSaved(position) {
    final contains = _saved.contains(position);
    return contains;
  }

  static ChangeNotifierProvider get provider {
    return ChangeNotifierProvider<WordPairState>(
      create: (_) => WordPairState(),
      child: const AppWidget(),
    );
  }
}
