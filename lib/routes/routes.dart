import 'package:flutter/material.dart';
import 'package:flutter_interfaz/screens/dashboard.dart';
import 'package:flutter_interfaz/screens/login_screen.dart';
import 'package:flutter_interfaz/screens/notes_screen.dart';

import '../screens/fruitApp.dart';
import '../screens/login.dart';
import '../screens/conversor.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return <String, WidgetBuilder>{
    '/fruitApp': (BuildContext context) => FruitApp(),
    '/login': (BuildContext context) => Login(),
    '/conversor': (BuildContext context) => Conversor(),
    '/dashboard': (BuildContext context) => DashBoard(),
    '/login_screen': (BuildContext context) => LoginScreen(),
    '/notes': (BuildContext context) => NotesScreen(),
  };
}
