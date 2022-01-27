import 'package:flutter/material.dart';
import 'package:flutter_application_1/preferencias/preferencias_usuario.dart';
import 'package:flutter_application_1/widgets/menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    prefs.pantalla = 'home';
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                'https://e00-marca.uecdn.es/assets/multimedia/imagenes/2020/06/04/15912219730543.jpg'),
          )
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Contador"),
            subtitle: Text("Acceso a contador"),
            onTap: () {
              Navigator.pushNamed(context, "contador");
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://conceptodefinicion.de/wp-content/uploads/2016/11/N%C3%BAmeros_Reales.jpg'),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            title: Text("Contactos"),
            subtitle: Text("Acceso a contactos"),
            onTap: () {
              Navigator.pushNamed(context, "contactos");
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://previews.123rf.com/images/cowpland/cowpland1412/cowpland141200270/34978675-contactos-icono-dise%C3%B1o-plano-.jpg'),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            title: Text("Favoritos"),
            subtitle: Text("Listado favoritos"),
            onTap: () {
              Navigator.pushNamed(context, "favoritos");
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://previews.123rf.com/images/cowpland/cowpland1412/cowpland141200270/34978675-contactos-icono-dise%C3%B1o-plano-.jpg'),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            title: Text("internet"),
            subtitle: Text(" internet"),
            onTap: () {
              Navigator.pushNamed(context, "internet");
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://previews.123rf.com/images/cowpland/cowpland1412/cowpland141200270/34978675-contactos-icono-dise%C3%B1o-plano-.jpg'),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            title: Text("form"),
            subtitle: Text(" form"),
            onTap: () {
              Navigator.pushNamed(context, "form");
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://previews.123rf.com/images/cowpland/cowpland1412/cowpland141200270/34978675-contactos-icono-dise%C3%B1o-plano-.jpg'),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
