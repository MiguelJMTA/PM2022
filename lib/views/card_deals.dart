import 'package:flutter/material.dart';
import 'package:flutter_interfaz/models/deals_model.dart';
import 'package:flutter_interfaz/screens/detail_deal_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CardDealsView extends StatelessWidget {
  CardDealsView({Key? key, required this.dealDAO}) : super(key: key);
  DealDAO? dealDAO;

  get btnSend => null;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        FadeInImage(
          fadeInDuration: Duration(milliseconds: 500),
          placeholder: AssetImage('images/activity_indicator.gif'),
          image: NetworkImage(dealDAO!.thumb!),
        ),
        Padding(padding: EdgeInsets.all(10)),
        Text(
          dealDAO!.title!,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        Text(
          "Price: \$" + dealDAO!.salePrice!,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        IconButton(
            alignment: Alignment.bottomCenter,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailDealScreen(
                            dealDAO: dealDAO!,
                          )));
            },
            icon: Icon(
              Icons.chevron_right,
              color: Colors.black,
            )),
      ]),
    );
  }
}
