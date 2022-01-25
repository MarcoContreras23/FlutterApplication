import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/menu.dart';
import 'package:image_picker/image_picker.dart';

class CamaraPage extends StatefulWidget {
  CamaraPage({Key? key}) : super(key: key);

  @override
  State<CamaraPage> createState() => _CamaraPageState();
}

class _CamaraPageState extends State<CamaraPage> {
  late File _url;
  bool _imagen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        title: Text("Camara"),
        actions: [
          IconButton(
              onPressed: () {
                _tomarFoto();
              },
              icon: Icon(Icons.camera)),
          IconButton(
              onPressed: () {
                _seleccionarImagen();
              },
              icon: Icon(Icons.file_copy))
        ],
      ),
      body: _imagen == false ? Container() : Image.file(_url),
    );
  }

  void _tomarFoto() async {
    final ImagePicker _picker = ImagePicker();
    final PickedFile? photo =
        await _picker.getImage(source: ImageSource.camera);
  }

  void _seleccionarImagen() async {
    final ImagePicker _picker = ImagePicker();
    final PickedFile? photo =
        await _picker.getImage(source: ImageSource.gallery);
    print(photo!.path);
    _url = File(photo.path);
    _imagen = true;
    setState(() {});
  }
}
