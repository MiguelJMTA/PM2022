
import 'package:flutter/material.dart';

import '../screens/fruitApp.dart';
import '../screens/login.dart';
import '../screens/conversor.dart';


Map<String,WidgetBuilder> getAppRoutes(){
  return <String,WidgetBuilder>{
    '/fruitApp' : (BuildContext context) => FruitApp(),
    '/login' : (BuildContext context) => Login(),
    '/conversor' : (BuildContext context) => Conversor(),    
  };
}