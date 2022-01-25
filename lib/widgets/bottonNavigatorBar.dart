import 'package:flutter/material.dart';

class BottonNavigator extends StatefulWidget {
  BottonNavigator({Key? key}) : super(key: key);

  @override
  State<BottonNavigator> createState() => _BottonNavigatorState();
}

class _BottonNavigatorState extends State<BottonNavigator> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      onTap: (value) {},
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit_sharp), label: 'Opción 1'),
        BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm_sharp), label: 'Opción 2')
      ],
    );
  }
}
