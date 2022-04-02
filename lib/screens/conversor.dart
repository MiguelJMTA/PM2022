import 'package:flutter/material.dart';

class Conversor extends StatefulWidget {
  Conversor({Key? key}) : super(key: key);

  @override
  State<Conversor> createState() => _ConversorState();
}

class _ConversorState extends State<Conversor> {
  bool isF = false;
  String txtTitleFinal = 'Se está convirtiendo de Celsius a Fahrenheit';

  @override
  Widget build(BuildContext context) {
    var txtCelsiusController = TextEditingController();
    var txtFarenheitController = TextEditingController();

    var txtCelsius = TextFormField(
      controller: txtCelsiusController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          hintText: "Grados Celsius",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
    );

    var txtFarenheit = TextFormField(
      controller: txtFarenheitController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          hintText: "Grados Fahrenheit",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
    );

    String txtTitleCelsius = 'Se está convirtiendo de Celsius a Fahrenheit';
    String txtTitleFarenheit = 'Se está convirtiendo de Fahrenheit a Celsius';

    final btnChange = ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.green),
        onPressed: () {
          isF = !isF;
          txtTitleFinal = !isF ? txtTitleCelsius : txtTitleFarenheit;
          setState(() {});
        },
        child: Text('Cambiar de unidades'));

    final btnConvert = ElevatedButton(
        onPressed: () {
          String resultado = "";
          if (isF) {
            if (txtFarenheitController.text.toString() == "") {
              txtFarenheitController.text = "0";
            }
            resultado =
                ((double.parse(txtFarenheitController.text.toString()) - 32) *
                            (5 / 9))
                        .toString() +
                    "°C";
          } else {
            if (txtCelsiusController.text.toString() == "") {
              txtCelsiusController.text = "0";
            }
            resultado = 
                (double.parse(txtCelsiusController.text.toString()) * (9 / 5) +
                            32)
                        .toString() +
                    "°F";
          }

          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 120,
                color: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('$resultado'),
                      ElevatedButton(
                        child: const Text('Cerrar'),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Text('Convertir'));

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          //FONDO
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
                Text(
                  '$txtTitleFinal',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                btnChange,
                SizedBox(height: 6),
                txtCelsius,
                SizedBox(height: 6),
                txtFarenheit,
                SizedBox(
                  height: 5,
                ),
                btnConvert,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
