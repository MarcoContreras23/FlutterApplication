import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/favoritos_provider.dart';
import 'package:provider/provider.dart';

class ListaFavoritosPage extends StatefulWidget {
  ListaFavoritosPage({Key? key}) : super(key: key);

  @override
  State<ListaFavoritosPage> createState() => _ListaFavoritosPageState();
}

class _ListaFavoritosPageState extends State<ListaFavoritosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favoritos"),
      ),
      body: _listaItem(),
    );
  }

  Widget _listaItem() {
    final favoritos = Provider.of<Favoritos>(context, listen: false);
    return ListView.builder(
      itemCount: favoritos.items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item${favoritos.items[index]}'),
          trailing: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              favoritos.remover(favoritos.items[index]);
              setState(() {});
            },
          ),
        );
      },
    );
  }
}
