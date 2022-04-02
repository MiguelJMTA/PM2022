import 'package:flutter/material.dart';
import 'package:flutter_interfaz/screens/about_us_screen.dart';
import 'package:flutter_interfaz/screens/add_note_screen.dart';
import 'package:flutter_interfaz/screens/dashboard.dart';
import 'package:flutter_interfaz/screens/detail_movie_screen.dart';
import 'package:flutter_interfaz/screens/login_screen.dart';
import 'package:flutter_interfaz/screens/notes_screen.dart';
import 'package:flutter_interfaz/screens/popular_screen.dart';

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
    '/add_note': (BuildContext context) => AddNoteScreen(),
    '/movies': (BuildContext context) => PopularScreen(),
    '/movies_detail': (BuildContext context) => DetailMovieScreen(),
    '/about_us':(BuildContext context)=>AboutUsScreen(),
  };
}
