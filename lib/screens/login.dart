import 'package:flutter/material.dart';
import 'package:flutter_interfaz/screens/dashboard.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isValidating = false;
  @override
  Widget build(BuildContext context) {
    var txtUserController = TextEditingController();
    var txtPasswordController = TextEditingController();
    final txtUser = TextFormField(
      controller: txtUserController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: "Introduce el usuario",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
    );
    final txtPassword = TextFormField(
      controller: txtPasswordController,
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
          hintText: "Introduce la contraseña",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
    );
    final btnSend = ElevatedButton(
        onPressed: () {
          isValidating = true;
          setState(() {});
          Future.delayed(new Duration(seconds: 4), () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoard()));
          });
        },
        child: Text('Entrar'));

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("images/fondo.jpg"),
            fit: BoxFit.fill,
          )),
        ),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                txtUser,
                SizedBox(
                  height: 6,
                ),
                txtPassword,
                SizedBox(
                  height: 5,
                ),
                btnSend,
              ],
            ),
          ),
        ),
        Positioned(
          child: Image.asset("images/itclogo.png",scale: 5,),
          bottom: 200,
        ),
        Positioned(
          child: isValidating ? CircularProgressIndicator() : Container(),
          bottom: 150,
        )
      ],
    );
  }
}
