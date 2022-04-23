import 'package:flutter/material.dart';
import 'package:flutter_interfaz/models/deals_model.dart';
import 'package:flutter_interfaz/routes/routes.dart';
import 'package:flutter_interfaz/screens/detail_deal_screen.dart';
import 'package:flutter_interfaz/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: getAppRoutes(),
      home: SplashScreen(),
    );
  }
}
