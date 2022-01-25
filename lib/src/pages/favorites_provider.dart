import 'package:flutter/material.dart';

class Favorites extends ChangeNotifier{

  final List<int> _ListFavorites = [];

  List<int> get items => _ListFavorites;

  void addFavorite(int item){
    _ListFavorites.add(item);
    notifyListeners();
  }

  void removeFavorite(int item){
    _ListFavorites.remove(item);
    notifyListeners();
  }

}