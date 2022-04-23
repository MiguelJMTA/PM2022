import 'package:flutter/material.dart';
import 'package:flutter_interfaz/models/deals_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CardDealsView extends StatelessWidget {
  CardDealsView({Key? key, this.dealDAO}) : super(key: key);
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
          "\$" + dealDAO!.salePrice!,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        IconButton(
            alignment: Alignment.bottomCenter,
            onPressed: () {
              Navigator.pushNamed(
                                  context,
                                  '/deal_detail',
                                  arguments: {
                                    'thumb':dealDAO!.thumb! ,
                                    'title':dealDAO!.title! ,
                                    'salePrice':dealDAO!.salePrice! ,
                                    'normalPrice':dealDAO!.normalPrice! ,
                                    'savings':dealDAO!.savings! ,
                                    'steamRatingText':dealDAO!.steamRatingText! ,
                                    'dealRating':dealDAO!.dealRating! ,
                                    'id':dealDAO!.gameID! ,
                                  },
                                );
            },
            icon: Icon(
              Icons.chevron_right,
              color: Colors.black,
            )),
      ]),
    );
  }
}
