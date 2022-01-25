import 'package:flutter/material.dart';
import 'package:flutter_application_1/preferencias/preferencias_usuario.dart';
import 'package:flutter_application_1/services/login_service.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _check = false;
  bool _mostrarPassword = true;

  String _usuario = '';
  String _password = '';

  final prefs = new PreferenciasUsuario();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _check = prefs.check;
    _usuario = prefs.usuario;
    _password = prefs.password;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _cuerpo(),
    );
  }

  Widget _cuerpo() {
    return Stack(
      children: [_fondo(), _logos(), _login()],
    );
  }

  Widget _login() {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(18.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20.0),
                // boxShadow: [
                //   BoxShadow(
                //       color: Colors.grey,
                //       blurRadius: size.height * 0.003,
                //       spreadRadius: size.height * 0.001)
                // ]
              ),
              margin: EdgeInsets.only(top: 220.0),
              height: size.height * 0.45,
              width: size.width * 0.7,
              child: _accesorios(),
            ),
            // Container(
            //   margin: EdgeInsets.only(top: 270.0),
            //   height: size.height * 0.4,
            //   width: size.width * 0.7,
            //   child: Card(
            //     elevation: 10.0,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _accesorios() {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            _usuarioText(),
            SizedBox(
              height: 10.0,
            ),
            _passwordText(),
            SizedBox(
              height: 10.0,
            ),
            _checkRecordarCredenciales(),
            SizedBox(
              height: 10.0,
            ),
            _botonIngresaar()
          ],
        ),
      ),
    );
  }

  Widget _usuarioText() {
    return TextFormField(
      initialValue: prefs.usuario,
      //keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Nombre de usuario',
          hintText: 'Ingrese nombre de usuario',
          suffixIcon: Icon(
            Icons.account_circle,
          )),
      onChanged: (value) {
        _usuario = value;
      },
      validator: (valor) {
        if (valor == '') {
          return 'El campo es obligatorio *';
        } else {
          return null;
        }
      },
    );
  }

  Widget _checkRecordarCredenciales() {
    return CheckboxListTile(
        title: Text("Recordar password"),
        value: _check,
        onChanged: (valor) {
          _check = valor!;

          if (_check) {
            prefs.usuario = _usuario;
            prefs.password = _password;
            prefs.check = _check;
          } else {
            prefs.usuario = '';
            prefs.password = '';
            prefs.check = false;
          }

          setState(() {});
        });
  }

  Widget _botonIngresaar() {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          _ingresar();
        }
      },
      child: Text("Ingresar"),
    );
  }

  void _ingresar() async {
    final loginService = LoginService();

    Map<String, dynamic> respuesta =
        await loginService.login(_usuario, _password);

    if (_check) {
      prefs.usuario = _usuario;
      prefs.password = _password;
      prefs.check = _check;
    } else {
      prefs.usuario = '';
      prefs.password = '';
      prefs.check = false;
    }

    if (respuesta['ok']) {
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      // mensaje error
    }
  }

  Widget _passwordText() {
    return TextFormField(
      initialValue: prefs.password,
      obscureText: _mostrarPassword == true ? true : false,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Password',
          hintText: 'Ingrese password',
          suffixIcon: InkWell(
            onTap: () {
              _mostrarPassword = !_mostrarPassword;
              setState(() {});
            },
            child: Icon(
              _mostrarPassword == true ? Icons.lock : Icons.lock_open,
            ),
          )),
      onChanged: (value) {
        _password = value;
      },
      validator: (valor) {
        if (valor == '') {
          return 'El campo es obligatorio *';
        } else {
          return null;
        }
      },
    );
  }

  Widget _logos() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 5.0),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                  radius: 60.0,
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/236x/e9/57/2a/e9572a70726980ed5445c02e1058760b.jpg')),
              Text(
                "Softlond",
                style: TextStyle(fontSize: 45.0),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _fondo() {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.4,
          color: Colors.white,
        ),
        Expanded(
          child: Container(
            color: Colors.blue[400],
          ),
        ),
      ],
    );
  }
}
