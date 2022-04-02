import 'package:flutter/material.dart';
import 'package:flutter_interfaz/settings/settings_color.dart';

import 'fruitApp/carousel.dart';
import 'fruitApp/counter.dart';

class FruitApp extends StatefulWidget {
  FruitApp({Key? key}) : super(key: key);

  @override
  State<FruitApp> createState() => _fruitAppState();
}

class _fruitAppState extends State<FruitApp> {
  bool _isFavorited = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: SettingsColor.backColorFruit,
        leading: Row(
          children: <Widget>[
            SizedBox(
              width: 5.0,
            ),
            IconButton(
              color: Colors.white,
              icon: const Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          SizedBox(
            width: 20.0,
          ),
        ],
      ),
      backgroundColor: SettingsColor.backColorFruit,
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              CarouselWithIndicatorDemo(),
              SizedBox(
                height: 50.0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(20.0),
                      topRight: const Radius.circular(20.0),
                    )),
                height: 600,
                width: 500,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Mango',
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text('1 each'),
                        SizedBox(
                          height: 20.0,
                        ),
                        CounterDesign(),
                        SizedBox(
                          height: 30.0,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    padding: EdgeInsets.all(10),
                                    height: 200,
                                    color: Colors.blue,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Text(
                                            'A mango is a type of fruit. '
                                            'The mango tree is native to South Asia, '
                                            'from where it has been taken to become one of the most widely cultivated fruits in the tropics.'
                                            'It is harvested in the month of march (summer season) till the end of May.',
                                            style: TextStyle(
                                                letterSpacing: 2.0,
                                                fontSize: 15.0),
                                          ),
                                          ElevatedButton(
                                            child: const Text('Close'),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Text("Show description")),
                        SizedBox(
                          height: 30.0,
                        ),
                        Row(
                          children: <Widget>[
                            ButtonTheme(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(
                                    color: SettingsColor.backColorFruit),
                              ),
                              height: 70.0,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white, elevation: 0.0),
                                onPressed: () {},
                                child: IconButton(
                                  icon: _isFavorited
                                      ? Icon(
                                          Icons.favorite_border,
                                          color: Colors.red,
                                        )
                                      : Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                  onPressed: () {
                                    _isFavorited = !_isFavorited;
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            ButtonTheme(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              height: 70.0,
                              minWidth: 260.0,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0.0,
                                  primary: SettingsColor.backColorFruit,
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Add to cart',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
