import 'package:flutter/material.dart';
import 'package:flutter_interfaz/database/database_movies.dart';
import 'package:flutter_interfaz/models/movies_model.dart';
import 'package:flutter_interfaz/network/api_popular.dart';
import 'package:flutter_interfaz/views/card_cast.dart';
import 'package:flutter_interfaz/views/card_movie_overview.dart';
import 'package:flutter_interfaz/views/movie_trailer.dart';

class DetailMovieScreen extends StatefulWidget {
  const DetailMovieScreen({Key? key}) : super(key: key);

  @override
  State<DetailMovieScreen> createState() => _DetailMovieScreenState();
}

class _DetailMovieScreenState extends State<DetailMovieScreen> {
  bool _isFavorited = true;
  DatabaseMovies? _databaseMovies;
  void initState() {
    // TODO: implement initState
    super.initState();
    _databaseMovies = DatabaseMovies();
  }

  @override
  Widget build(BuildContext context) {
    final movie =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    _databaseMovies!.getOne(movie['id']).then((value) {
      if (value > 0) {
        _isFavorited = false;
      }
    });

    return Scaffold(
        appBar: AppBar(
          title: Text(movie['title']),
          actions: <Widget>[
            IconButton(
                icon: _isFavorited
                    ? Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      )
                    : Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                onPressed: () {
                  _isFavorited = !_isFavorited;
                  if (_isFavorited) {
                    _databaseMovies!.delete(movie['id']).then((value) {
                      if (value == 1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Borrado correctamente")));
                        setState(() {});
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("Error")));
                      }
                    });
                  } else {
                    MovieDAO objMovie = MovieDAO(
                      id: movie['id'],
                      title: movie['title'],
                    );
                    _databaseMovies!.insert(objMovie.toMap()).then((value) {
                      if (value > 0) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("Saved")));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("Error")));
                      }
                    });
                  }
                  setState(() {});
                })
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            CardMovieTrailer(id: movie['id']),
            CardMovieOverview(overview: movie['overview']!),
            CastCard(id: movie['id'])
          ],
        )));
  }
}
