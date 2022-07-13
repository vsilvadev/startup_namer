import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startup_namer/core/app_colors.dart';
import 'package:startup_namer/pages/favorites_list/favorites_screen.dart';
import 'package:startup_namer/pages/home/word_pair_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    final wordPairState = context.watch<WordPairState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FavoritesScreen()),
              );
            },
            tooltip: 'Saved Suggestions',
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return const Divider();

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }

          final alreadySaved = wordPairState.checkSaved(_suggestions[index]);
          return ListTile(
            title: Text(
              _suggestions[index].asPascalCase,
              style: _biggerFont,
            ),
            trailing: Icon(
              alreadySaved ? Icons.favorite : Icons.favorite_border_outlined,
              color: alreadySaved ? AppColors.blue : null,
              semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
            ),
            onTap: () {
              setState(() {
                if (alreadySaved) {
                  wordPairState.removeFromList(_suggestions[index]);
                } else {
                  wordPairState.addToList(_suggestions[index]);
                }
              });
            },
          );
        },
      ),
    );
  }
}
