import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/menu.dart';

class ContadorPage extends StatefulWidget {
  ContadorPage({Key? key}) : super(key: key);

  @override
  _ContadorPageState createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  int _contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla Contador'),
      ),
      body: _cuerpo(),
      floatingActionButton: _floatActionButton(),
    );
  }

  Widget _floatActionButton() {
    return FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          _calcularContador();
        });
  }

  void _calcularContador() {
    _contador++;
    setState(() {});
  }

  Widget _cuerpo() {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_label(), _contadorText()],
        ),
      ),
    );
  }

  Widget _label() {
    return Text('Cantidad de taps', style: TextStyle(fontSize: 40.5));
  }

  Widget _contadorText() {
    return Text('$_contador', style: TextStyle(fontSize: 50.5));
  }
}
