import 'package:flutter/material.dart';
import 'package:flutter_interfaz/screens/login.dart';
import 'package:flutter_interfaz/settings/settings_color.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: Login(),
      duration: 5000,
      imageSize: 130,
      imageSrc: "images/itclogo.png",
      text: "TecNM en Celaya",
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
        fontSize: 40.0,
      ),
      colors: [
        Colors.blueGrey,
        Colors.blue,
        Colors.green,
        Colors.greenAccent,
      ],
      backgroundColor:Colors.white,
    );
  }
}
