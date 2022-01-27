import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Container(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://e00-marca.uecdn.es/assets/multimedia/imagenes/2020/06/04/15912219730543.jpg'),
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  Text("Miguel Ospina")
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text("Home"),
                  trailing: Icon(Icons.home),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, 'home');
                  },
                ),
                ListTile(
                  title: Text("Google Maps"),
                  trailing: Icon(Icons.map),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, 'mapa');
                  },
                ),
                ListTile(
                  title: Text("Lectro Qr"),
                  trailing: Icon(Icons.scanner_outlined),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, 'qr');
                  },
                ),
                ListTile(
                  title: Text("Camara"),
                  trailing: Icon(Icons.camera),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, 'camara');
                  },
                ),
                ListTile(
                  title: Text("internet"),
                  trailing: Icon(Icons.navigation_outlined),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, 'internet');
                  },
                ),
                ListTile(
                  title: Text("form"),
                  trailing: Icon(Icons.forum),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, 'form');
                  },
                ),
                ListTile(
                  title: Text("Cerrar Sesión"),
                  trailing: Icon(Icons.logout),
                  onTap: () {
                    _showMyDialog();

                    //Navigator.pushReplacementNamed(context, 'login');
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Señor usuario'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Ud esta seguro de cerrar sesión?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'login');
              },
            ),
          ],
        );
      },
    );
  }
}
