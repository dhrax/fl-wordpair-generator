import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_wordpair_generator/app_state.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {

    var appState = context.watch<AppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text('Favorites: '),
            ),
            for(var element in appState.favorites)
              ListTile (
                leading: Icon(Icons.favorite),
                title: Text(element.asLowerCase),
                onTap: (){
                  print(element.asLowerCase);
                },
              ),
          ],
        )
      ),
    );
  }
}