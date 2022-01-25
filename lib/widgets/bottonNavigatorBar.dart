import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/favoritos_page.dart';
import 'package:flutter_application_1/src/pages/opcion1.dart';
import 'package:flutter_application_1/src/pages/opcion2.dart';
import 'package:flutter_application_1/src/pages/screen_provider.dart';
import 'package:provider/provider.dart';

class BottonNavigator extends StatefulWidget {
  BottonNavigator({Key? key}) : super(key: key);

  @override
  State<BottonNavigator> createState() => _BottonNavigatorState();
}

class _BottonNavigatorState extends State<BottonNavigator> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final screens = Provider.of<ScreenCurrent>(context);
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (value) {
        _currentIndex = value;
        screens.screen = value;
        setState(() {});
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit_sharp), label: 'Opción 1'),
        BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm_sharp), label: 'Opción 2')
      ],
    );
  }
}
