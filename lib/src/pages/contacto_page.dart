import 'package:flutter/material.dart';

class ContactoPage extends StatelessWidget {
  const ContactoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacto"),
      ),
      body: _cuerpoContactos(),
    );
  }

  Widget _cuerpoContactos() {
    return Container(
      child: Column(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                color: Colors.red,
              )),
          Expanded(
              flex: 5,
              child: Container(
                color: Colors.blue,
              )),
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.yellow,
              )),
        ],
      ),
    );
  }
}
