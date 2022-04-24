import 'package:flutter/material.dart';
import 'package:flutter_interfaz/screens/deals_screen.dart';

class DealsHomeScreen extends StatefulWidget {
  DealsHomeScreen({Key? key}) : super(key: key);

  @override
  State<DealsHomeScreen> createState() => _DealsScreenState();
}

class _DealsScreenState extends State<DealsHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Currently steam Deals"),
      ),
      body: Center(
        child: DealsScreen(),
      ),
    );
  }
}
