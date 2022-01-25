import 'package:flutter/material.dart';

class Favoritos extends ChangeNotifier {
  final List<int> _listaFavoritos = [];

  List<int> get items => _listaFavoritos;

  void agregar(int item) {
    _listaFavoritos.add(item);
    notifyListeners();
  }

  void remover(int item) {
    _listaFavoritos.remove(item);
    notifyListeners();
  }
}
