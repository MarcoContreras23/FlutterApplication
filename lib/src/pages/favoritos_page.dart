import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/favoritos_provider.dart';
import 'package:flutter_application_1/src/pages/opcion1.dart';
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
      body: _cuerpo(),
      bottomNavigationBar: BottonNavigator(),
    );
  }

  Widget _cuerpo() {
    switch (_currentIndex) {
      case 0:
        return Opcion1();
      case 1:
        return Opcion2();
      default:
        return Opcion1();
    }
  }

  Widget _bottonNavigatorBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (value) {
        _currentIndex = value;
        setState(() {});
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit_sharp), label: 'Opción 1'),
        BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm_sharp), label: 'Opción 2')
      ],
    );
  }

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
  }
}
