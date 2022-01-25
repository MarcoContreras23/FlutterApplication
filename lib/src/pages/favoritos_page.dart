import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/favoritos_provider.dart';
import 'package:flutter_application_1/src/pages/opcion1.dart';
import 'package:flutter_application_1/src/pages/screen_provider.dart';
import 'package:flutter_application_1/widgets/bottonNavigatorBar.dart';
import 'package:provider/provider.dart';

import 'opcion2.dart';

class FavoritosPage extends StatefulWidget {
  FavoritosPage({Key? key}) : super(key: key);

  @override
  State<FavoritosPage> createState() => _FavoritosPageState();
}

class _FavoritosPageState extends State<FavoritosPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
        actions: [
          // IconButton(
          //     onPressed: () async {
          //       await Navigator.pushNamed(context, 'lista-favoritos');
          //       setState(() {});
          //     },
          //     icon: Icon(Icons.favorite))
        ],
      ),
      // expone el builder para leer la instancia del provider
      body: Consumer<ScreenCurrent>(
        builder: (context, current, child) {
          switch (current.current) {
            case 0:
              return Opcion1();
            case 1:
              return Opcion2();
            default:
              return Opcion1();
          }
        },
      ),
      bottomNavigationBar: BottonNavigator(),
    );
  }
}

class Screens extends ChangeNotifier {
  final List<int> _listScreen = [];

  List<int> get index => _listScreen;

  void screenView(int index) {
    _listScreen.add(index);
    notifyListeners();
  }
}
/*
  Widget _listaItems() {
    final favoritos = Provider.of<Favoritos>(context, listen: false);

    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item$index'),
          trailing: IconButton(
              onPressed: () {
                favoritos.items.contains(index)
                    ? favoritos.remover(index)
                    : favoritos.agregar(index);
                setState(() {});
              },
              icon: favoritos.items.contains(index)
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border)),
        );
      },
    );
  }*/