import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class ContactosServie {
  Future<List<dynamic>> cargarContactos() async {
    final datos = await rootBundle.loadString('data/contactos.json');
    Map<String, dynamic> respuesta = json.decode(datos);

    return Future.delayed(Duration(seconds: 5), () {
      return respuesta['contactos'];
    });
  }
}
