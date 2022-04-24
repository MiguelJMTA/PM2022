import 'package:flutter/material.dart';
import 'package:flutter_interfaz/models/deals_model.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailDealScreen extends StatefulWidget {
  DealDAO? dealDAO;
  DetailDealScreen({Key? key, this.dealDAO}) : super(key: key);

  @override
  State<DetailDealScreen> createState() => _DetailDealScreenState();
}

class _DetailDealScreenState extends State<DetailDealScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Steam Deal"),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            //FONDO
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("images/fondo_games.jpg"),
              fit: BoxFit.fitHeight,
              opacity: 10,
            )),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: ListView(
                padding: EdgeInsets.all(10),
                shrinkWrap: true,
                children: [
                  FadeInImage(
                    fadeInDuration: Duration(milliseconds: 500),
                    placeholder: AssetImage('images/activity_indicator.gif'),
                    image: NetworkImage(widget.dealDAO!.thumb!),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  DefaultTextStyle(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 50.0,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        ScaleAnimatedText(widget.dealDAO!.title!,
                            textAlign: TextAlign.center),
                      ],
                      isRepeatingAnimation: true,
                      repeatForever: true,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Prices: ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Actual: \$" + widget.dealDAO!.salePrice!,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Normal: \$" + widget.dealDAO!.normalPrice!,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Savings: " + widget.dealDAO!.savings! + "%",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Ratings: ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Game: " + widget.dealDAO!.steamRatingText!,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Deal: " + widget.dealDAO!.dealRating!,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      _launchUrl();
                    },
                    child: const Text('Go to steam'),
                  ),
                ]),
          ),
        ],
      ),
    );
  }

  void _launchUrl() async {
    if (!await launchUrl(Uri.parse("https://store.steampowered.com/app/" +
        widget.dealDAO!.steamAppID! +
        "/"))) throw ScaffoldMessenger(child: Text("Can not open the link"));
  }
}
