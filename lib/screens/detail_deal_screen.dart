import 'package:flutter/material.dart';
import 'package:flutter_interfaz/models/deals_model.dart';

class DetailDealScreen extends StatefulWidget {
  DetailDealScreen({
    Key? key,
    this.id,
    this.thumb,
    this.title,
    this.salePrice,
    this.normalPrice,
    this.savings,
    this.steamRatingText,
    this.dealRating,
  }) : super(key: key);
  var id;
  var thumb;
  var title;
  var salePrice;
  var normalPrice;
  var savings;
  var steamRatingText;
  var dealRating;

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
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        FadeInImage(
          fadeInDuration: Duration(milliseconds: 500),
          placeholder: AssetImage('images/activity_indicator.gif'),
          image: NetworkImage(widget.thumb),
        ),
        Padding(padding: EdgeInsets.all(10)),
        Text(
          widget.title!,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        Text(
          "Actual price: \$" + widget.salePrice,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        Text(
          "Normal price: \$" + widget.normalPrice,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        Text(
          "Savings: " + widget.savings + "%",
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        Text(
          "Rating: \$" + widget.steamRatingText,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        Text(
          "Deal rating: \$" + widget.dealRating,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
      ]),
    );
  }
}
