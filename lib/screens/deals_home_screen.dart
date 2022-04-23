import 'package:flutter/material.dart';
import 'package:flutter_interfaz/screens/deals_screen.dart';

class DealsHomeScreen extends StatefulWidget {
  DealsHomeScreen({Key? key}) : super(key: key);

  @override
  State<DealsHomeScreen> createState() => _DealsScreenState();
}

class _DealsScreenState extends State<DealsHomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<MaterialColor> _colors = <MaterialColor>[
    Colors.red,
    Colors.green,
    Colors.purple,
  ];
  List<Widget> _widgetOptions = <Widget>[
    DealsScreen(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.discount),
            label: 'Deals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.games),
            label: 'Games',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Stores',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        backgroundColor: _colors.elementAt(_selectedIndex),
        onTap: _onItemTapped,
      ),
    );
  }
}
