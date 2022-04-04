import 'package:flutter/material.dart';
import 'package:flutter_interfaz/models/popular_model.dart';

class CardMovieOverview extends StatelessWidget {
  CardMovieOverview({Key? key, required this.overview}) : super(key: key);
  String overview;
  @override
  Widget build(BuildContext context) {
    final movie =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LimitedBox(
          child: Text(
            overview,
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
