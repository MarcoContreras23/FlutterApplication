import 'dart:convert';

import 'package:flutter_application_1/preferencias/preferencias_usuario.dart';
import 'package:http/http.dart' as http;

class LoginService {
  Future<Map<String, dynamic>> login(String usuario, String password) async {
    String url = 'http://190.121.155.147:8080/arbolado-api/oauth/token';

    final data = {
      'username': '$usuario',
      'password': '$password',
      'grant_type': 'password',
      'client_id': 'spring-security-oauth2-read-write-client'
    };

    final res = await http.post(Uri.parse(url),
        headers: {
          'Authorization':
              'Basic c3ByaW5nLXNlY3VyaXR5LW9hdXRoMi1yZWFkLXdyaXRlLWNsaWVudDpzcHJpbmctc2VjdXJpdHktb2F1dGgyLXJlYWQtd3JpdGUtY2xpZW50LXBhc3N3b3JkMTIzNA=='
        },
        body: data);

    Map<String, dynamic> respuesta = json.decode(res.body);

    if (respuesta.containsKey('access_token')) {
      final prefs = new PreferenciasUsuario();
      prefs.token = respuesta['access_token'];

      return {"ok": true, 'token': respuesta['access_token']};
    } else {
      return {"ok": false, 'mensaje': respuesta['error_description']};
    }
  }
}
