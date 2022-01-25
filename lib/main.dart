import 'package:flutter/material.dart';
import 'package:flutter_application_1/preferencias/preferencias_usuario.dart';
import 'package:flutter_application_1/provider/favoritos_provider.dart';
import 'package:flutter_application_1/src/pages/camara_page.dart';
import 'package:flutter_application_1/src/pages/contacto_page.dart';
import 'package:flutter_application_1/src/pages/contactos_page.dart';
import 'package:flutter_application_1/src/pages/contador_page.dart';
import 'package:flutter_application_1/src/pages/favoritos_page.dart';
import 'package:flutter_application_1/src/pages/home_page.dart';
import 'package:flutter_application_1/src/pages/list_favoritos_page.dart';
import 'package:flutter_application_1/src/pages/login_page.dart';
import 'package:flutter_application_1/src/pages/mapa_page.dart';
import 'package:flutter_application_1/src/pages/qr_page.dart';

import 'package:provider/provider.dart';

void main() async {
  final prefs = new PreferenciasUsuario();
  WidgetsFlutterBinding();
  await prefs.iniciarPreferencias();

  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();

    return ChangeNotifierProvider<Favoritos>(
        create: (context) => Favoritos(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: 'favoritos',
          routes: {
            "contador": (BuildContext context) => ContadorPage(),
            "contactos": (BuildContext context) => ContactosPage(),
            "contacto": (BuildContext context) => ContactoPage(),
            "home": (BuildContext context) => HomePage(),
            "login": (BuildContext context) => LoginPage(),
            "mapa": (BuildContext context) => MapaPage(),
            "qr": (BuildContext context) => QrPage(),
            "camara": (BuildContext context) => CamaraPage(),
            "favoritos": (BuildContext context) => FavoritosPage(),
            "lista-favoritos": (BuildContext context) => ListaFavoritosPage(),
          },
        ));
  }
}
