import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia = PreferenciasUsuario.internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario.internal();

  late SharedPreferences _prefs;

  iniciarPreferencias() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  String get token {
    return _prefs.getString('token') ?? '';
  }

  set token(String valor) {
    _prefs.setString('token', valor);
  }

  String get usuario {
    return _prefs.getString('usuario') ?? '';
  }

  set usuario(String valor) {
    _prefs.setString('usuario', valor);
  }

  String get password {
    return _prefs.getString('password') ?? '';
  }

  set password(String valor) {
    _prefs.setString('password', valor);
  }

  bool get check {
    return _prefs.getBool('check') ?? false;
  }

  set check(bool valor) {
    _prefs.setBool('check', valor);
  }

  String get pantalla {
    return _prefs.getString('pantalla') ?? 'login';
  }

  set pantalla(String valor) {
    _prefs.setString('pantalla', valor);
  }
}
