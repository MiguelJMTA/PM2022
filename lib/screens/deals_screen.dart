import 'package:flutter/material.dart';
import 'package:flutter_interfaz/models/deals_model.dart';
import 'package:flutter_interfaz/network/api_deals.dart';
import 'package:flutter_interfaz/views/card_deals.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DealsScreen extends StatefulWidget {
  DealsScreen({Key? key}) : super(key: key);

  @override
  State<DealsScreen> createState() => _DealsScreenState();
}

class _DealsScreenState extends State<DealsScreen> {
  ApiDeals? apiDeals;
  @override
  void initState() {
    super.initState();
    apiDeals = ApiDeals();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: apiDeals!.getAllDeals(),
        builder:
            (BuildContext context, AsyncSnapshot<List<DealDAO>?> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Ocurrió un error al ejecutar"));
          } else {
            if (snapshot.connectionState == ConnectionState.done) {
              return _listDeals(snapshot.data!);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }
        },
      ),
    );
  }
}

Widget _listDeals(List<DealDAO> list) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: StaggeredGridView.countBuilder(
      staggeredTileBuilder: (int index) =>
     StaggeredTile.fit(1),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        DealDAO deal = list.elementAt(index);
        return CardDealsView(dealDAO: deal);
      },
      crossAxisCount: 2,
    ),
  );
}
