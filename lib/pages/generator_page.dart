import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_wordpair_generator/app_state.dart';
import 'package:fl_wordpair_generator/widgets/big_card.dart';

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var wordPair = appState.current;

    IconData icon;
    if(appState.isWordFavorite()){
      icon = Icons.favorite;
    }else{
      icon = Icons.favorite_border;
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigCard(wordPair: wordPair),
            SizedBox(height: 20,), //used to created visual spaces, doesnt render anything
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  onPressed:(){
                    appState.toggleFavorite();
                  }, 
                  icon: Icon(icon), 
                  label: Text('Like')),
                ElevatedButton(
                  onPressed: (){
                    appState.generateWord();
                  }, 
                  child: Text('Next')),
              ],
            ),
          ],
          
        ),
      ),
    );
  }
}