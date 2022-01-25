import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/contactos_service.dart';
import 'package:loading_indicator/loading_indicator.dart';

class ContactosPage extends StatefulWidget {
  @override
  _ContactosPageState createState() => _ContactosPageState();
}

class _ContactosPageState extends State<ContactosPage> {
  List<dynamic> _listaContactos = [];

  // final List<Map<String, dynamic>> _listaContactos = [
  //   {"nombres": "Miguel Ospina", "telefono": "234567899", "inicial": "M"},
  //   {"nombres": "Samuel Ospina", "telefono": "7654345", "inicial": "S"},
  //   {"nombres": "Emiliano Ospina", "telefono": "7876543", "inicial": "E"}
  // ];

  @override
  void initState() {
    //_cargarContactos();

    // TODO: implement initState
    super.initState();
  }

  void _cargarContactos() async {
    final contactosService = ContactosServie();
    List<dynamic> listaContactos = await contactosService.cargarContactos();
    _listaContactos = listaContactos;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista Contactos"),
        ),
        body: _itemContactos());
  }

  Widget _itemContactos() {
    final contactosService = ContactosServie();
    return FutureBuilder(
      future: contactosService.cargarContactos(),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  Navigator.pushNamed(context, 'contacto');
                },
                title: Text('${snapshot.data![index]['nombres']}'),
                subtitle: Text('${snapshot.data![index]['telefono']}'),
                trailing: Icon(Icons.arrow_forward_ios),
                leading: CircleAvatar(
                  child: Text('${snapshot.data![index]['inicial']}'),
                ),
              );
            },
          );
        } else {
          return Center(
            child: LoadingIndicator(
              indicatorType: Indicator.ballScaleMultiple,
            ),
          );
          //return Center(child: CircularProgressIndicator());
        }
      },
    );

    // return ListView.builder(
    //   itemCount: _listaContactos.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     return ListTile(
    //       onTap: () {
    //         Navigator.pushNamed(context, 'contacto');
    //       },
    //       title: Text('${_listaContactos[index]['nombres']}'),
    //       subtitle: Text('${_listaContactos[index]['telefono']}'),
    //       trailing: Icon(Icons.arrow_forward_ios),
    //       leading: CircleAvatar(
    //         child: Text('${_listaContactos[index]['inicial']}'),
    //       ),
    //     );
    //   },
    // );
  }
}
