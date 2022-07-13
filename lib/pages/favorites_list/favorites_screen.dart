import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startup_namer/core/app_colors.dart';
import 'package:startup_namer/pages/home/favorites_state.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wordPairState = context.watch<FavoritesState>();
    final savedList = wordPairState.getSavedList();

    final tiles = savedList.asMap().entries.map(
      (entry) {
        return ListTile(
          title: Text(
            entry.value.asPascalCase,
            style: const TextStyle(fontSize: 18),
          ),
          trailing: const Icon(
            Icons.favorite,
            color: AppColors.blue,
          ),
          onTap: () {
            final alreadySaved = wordPairState.checkSaved(entry.value);

            if (alreadySaved) {
              wordPairState.removeFromList(entry.value);
            } else {
              wordPairState.addToList(entry.value);
            }
          },
        );
      },
    );
    final divided = tiles.isNotEmpty
        ? ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList()
        : <Widget>[];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Suggestions'),
      ),
      body: ListView(children: divided),
    );
  }
}
