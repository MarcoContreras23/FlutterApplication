import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InternetPage extends StatefulWidget {
  InternetPage({Key? key}) : super(key: key);

  @override
  State<InternetPage> createState() => _InternetPageState();
}

class _InternetPageState extends State<InternetPage> {

  String _url = 'https://flutter.dev';
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
            child: RaisedButton(
              onPressed: _launchURL,
              child: Text('Show Flutter homepage'),
            ),
          ),
    );
  }

  void _launchURL() async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
