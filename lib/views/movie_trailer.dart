import 'package:flutter/material.dart';
import 'package:flutter_interfaz/models/popular_model.dart';
import 'package:flutter_interfaz/network/api_popular.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'dart:developer';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class CardMovieTrailer extends StatefulWidget {
  var id;

  CardMovieTrailer({Key? key, required this.id}) : super(key: key);

  @override
  State<CardMovieTrailer> createState() => _CardMovieTrailerState();
}

class _CardMovieTrailerState extends State<CardMovieTrailer> {
  ApiPopular? apiPopular;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiPopular = ApiPopular();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error'));
          } else {
            if (snapshot.connectionState == ConnectionState.done) {
              return YoutubePlayer(
                controller: YoutubePlayerController(
                    initialVideoId: snapshot.data.toString()),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }
        },
        future: apiPopular!.getTrailer(widget.id),
      ),
    );
  }
}
