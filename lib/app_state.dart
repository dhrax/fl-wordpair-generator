import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  var current = WordPair.random();
  var favorites = <WordPair>[];

  void generateWord(){
    current = WordPair.random();
    notifyListeners();
  }

  void toggleFavorite(){
    if(isWordFavorite()){
      favorites.remove(current);
    }else{
      favorites.add(current);
    }
    notifyListeners();
  }

  bool isWordFavorite() => favorites.contains(current);
}